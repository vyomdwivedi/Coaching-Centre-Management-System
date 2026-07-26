from db import fetch, fetch, execute_query
import streamlit as st
import csv

def fee_management():
    fee_option = st.selectbox("Select Fee Management Option", ["View Fee Details", "Update Fee Status", "Add Fee Payment", "Generate Fee Report"])

    # View Fee Details
    if fee_option == "View Fee Details":
        students = fetch('SELECT student_id, name FROM students;')
        fee_details = fetch(f"""
            SELECT f.fee_id, f.amount, f.due_date, f.status
            FROM fees f
        """)
        status_check = st.selectbox("Select Fee Status", ["Paid", "Unpaid"])
        if st.button("View Fee Details"):
            if status_check == "Paid":
                for fee in fee_details:
                    if fee['status'] == 'Paid':
                        st.text(f"Fee ID: {fee['fee_id']}, Amount: {fee['amount']}, Due Date: {fee['due_date']}, Status: {fee['status']}")
            if status_check == "Unpaid":
                for fee in fee_details:
                    if fee['status'] == 'Unpaid':
                        st.text(f"Fee ID: {fee['fee_id']}, Amount: {fee['amount']}, Due Date: {fee['due_date']}, Status: {fee['status']}")

    # Update Fee Status
    elif fee_option == "Update Fee Status":
        students = fetch('SELECT student_id, name FROM students;')
        student_options = [f"{student['student_id']} - {student['name']}" for student in students]
        selected_student = st.selectbox("Select Student", student_options)
        student_id = selected_student.split(" - ")[0]
        fee_details = fetch(f"""
            SELECT f.fee_id, f.amount, f.due_date, f.status
            FROM fees f
            WHERE f.student_id = %s
        """, (student_id,))
        for fee in fee_details:
            st.text(f"Fee ID: {fee['fee_id']}, Amount: {fee['amount']}, Due Date: {fee['due_date']}, Status: {fee['status']}")
        if st.button("Mark Fee as Paid"):
            execute_query(f"""
                UPDATE fees SET status = 'Paid'
                WHERE student_id = %s
            """, (student_id,))
        if st.button("Mark Fee as Unpaid"):
                    execute_query(f"""
                        UPDATE fees SET status = 'Unpaid'
                        WHERE student_id = %s
                    """, (student_id,))
        
    # Add Fee Payment
    elif fee_option == "Add Fee Payment":
        students = fetch('SELECT student_id, name FROM students;')
        student_options = [f"{student['student_id']} - {student['name']}" for student in students]
        selected_student = st.selectbox("Select Student", student_options)
        student_id = selected_student.split(" - ")[0]
        amount_paid = st.number_input("Enter Amount Paid", min_value=0.0)
        payment_date = st.date_input("Enter Payment Date")
        if st.button("Add Fee Payment"):
            execute_query(f"INSERT INTO fee_payments (student_id, amount_paid, payment_date) VALUES (%s, %s, %s)", (student_id, amount_paid, payment_date))
            st.success("Fee payment added successfully.")

    # Generate Fee Report
    elif fee_option == "Generate Fee Report":
        report_type = st.selectbox("Select Report Type", ["All Students", "By Student"])
        if report_type == "All Students":
            fee_reports = fetch("""
                SELECT s.student_id, s.name,
                       COALESCE(SUM(f.amount), 0) AS total_fee,
                       COALESCE(SUM(CASE WHEN f.status = 'Paid' THEN f.amount ELSE 0 END), 0) AS total_paid
                FROM students s
                LEFT JOIN fees f ON s.student_id = f.student_id
                GROUP BY s.student_id, s.name
            """)
            if st.button("Generate Report"):
                csv_file = "exports/fee_report.csv"
                with open(csv_file, mode='w', newline='') as file:
                    writer = csv.writer(file)
                    writer.writerow(["Student ID", "Name", "Total Fee", "Total Paid"])
                    for report in fee_reports:
                        writer.writerow([report['student_id'], report['name'], report['total_fee'], report['total_paid']])
                st.success(f"Fee report generated and saved as {csv_file}.")
        elif report_type == "By Student":
            students = fetch('SELECT student_id, name FROM students;')
            student_options = [f"{student['student_id']} - {student['name']}" for student in students]
            selected_student = st.selectbox("Select Student", student_options)
            student_id = selected_student.split(" - ")[0]
            fee_report = fetch(f"""
                SELECT s.student_id, s.name,
                       COALESCE(SUM(f.amount), 0) AS total_fee,
                       COALESCE(SUM(CASE WHEN f.status = 'Paid' THEN f.amount ELSE 0 END), 0) AS total_paid
                FROM students s
                LEFT JOIN fees f ON s.student_id = f.student_id
                WHERE s.student_id = %s
                GROUP BY s.student_id, s.name
            """, (student_id,))
            if st.button("Generate Report"):
                if fee_report:
                    report = fee_report[0]
                    csv_file = f"fee_logs/fee_report_{report['student_id']}.csv"
                    with open(csv_file, mode='w', newline='') as file:
                        writer = csv.writer(file)
                        writer.writerow(["Student ID", "Name", "Total Fee", "Total Paid"])
                        writer.writerow([report['student_id'], report['name'], report['total_fee'], report['total_paid']])
                    st.success(f"Fee report generated for student {report['name']}, {report['student_id']}.")
                else:
                    st.write("No fee records found for the selected student.")