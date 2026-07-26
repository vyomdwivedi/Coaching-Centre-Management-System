from db import fetch, execute_query
import streamlit as st
import csv

def result_management():
    batches = fetch('SELECT DISTINCT batch_id FROM tests ORDER BY batch_id;')
    batch_options = [batch['batch_id'] for batch in batches]
    if not batch_options:
        st.info("No batches found.")
        return
    batch_id = st.selectbox("Select Batch", batch_options)
    tests = fetch("""
        SELECT test_id FROM tests 
        WHERE batch_id = %s 
        ORDER BY test_id;
    """,(batch_id,))
    test_options = [test['test_id'] for test in tests]
    if not test_options:
        st.info("No tests found for the selected batch.")
        return
    test_id = st.selectbox("Select Test", test_options)
    date = fetch("""
        SELECT test_date FROM tests 
        WHERE test_id = %s;
    """, (test_id,))[0]['test_date']
    students = fetch(f"""
        SELECT 
            s.student_id, 
            s.name
        FROM students s
        JOIN enrollments e ON s.student_id = e.student_id
        WHERE e.batch_id = %s
    """, (batch_id,))
    test_results_data = {}
    for student in students:
        student_id, name = student['student_id'], student['name']
        score = st.number_input(
            f"{student_id} - {name} (Score)",
            min_value=0,
            max_value=50,
            key=f"test_score_{student_id}"
        )
        test_results_data[student_id] = score
    if st.button("Save Test Results"):
        for student_id, score in test_results_data.items():
            execute_query("""
                INSERT INTO results (test_id, student_id, marks_obtained)
                VALUES (%s, %s, %s)
                ON DUPLICATE KEY UPDATE marks_obtained = %s
            """, (test_id, student_id, score, score))

        # Generate CSV report
        csv_file = f"test_results/test_results_{date}_{test_id}.csv"
        with open(csv_file, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["Test ID", "Student ID", "Name", "Date", "Score"])
            for student in students:
                student_id, name = student['student_id'], student['name']
                score = test_results_data[student_id]
                writer.writerow([test_id, student_id, name, date, score])

        st.success(f"Test results saved and report generated as {csv_file}.")