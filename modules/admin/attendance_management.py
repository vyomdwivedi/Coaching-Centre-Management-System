from db import fetch, execute_query
import streamlit as st
import csv

def attendance_management():
    batches = fetch('SELECT batch_id FROM batches;')
    batch_options = [batch['batch_id'] for batch in batches]
    batch_id = st.selectbox("Select Batch", batch_options)
    date = st.date_input("Select Date")

    students = fetch(f"""
        SELECT s.student_id, s.name
        FROM students s
        JOIN enrollments e ON s.student_id = e.student_id
        WHERE e.batch_id = %s
    """, (batch_id,))

    attendance_data = {}

    for student in students:
        student_id, name = student['student_id'], student['name']
        status = st.radio(
            f"{student_id} - {name}",
            ["Present", "Absent"],
            horizontal=True,
            key=f"attendance_{student_id}"
        )
        attendance_data[student_id] = status

    if st.button("Save Attendance"):
        for student_id, status in attendance_data.items():
            execute_query("""
                INSERT INTO attendance (student_id, batch_id, attendance_date, status)
                VALUES (%s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE status = %s
            """, (student_id, batch_id, date, status, status))
        attendance_report = fetch("""
            SELECT s.student_id, s.name, a.attendance_date, a.status
            FROM students s
            JOIN attendance a ON s.student_id = a.student_id
            WHERE a.batch_id = %s AND a.attendance_date = %s
        """, (batch_id, date))

        # Generate CSV report
        csv_file = f"attendance_logs/attendance_report_{date}_{batch_id}.csv"
        with open(csv_file, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["Student ID", "Name", "Attendance Date", "Status"])
            for report in attendance_report:
                writer.writerow([report['student_id'], report['name'], report['attendance_date'], report['status']])

        st.success(f"Attendance report generated and saved as {csv_file}.")