from db import fetch, execute_query
import streamlit as st

def batch_management():
    batches = fetch('SELECT batch_id FROM batches;')
    batch_options = [batch['batch_id'] for batch in batches]
    batch_id = st.selectbox("Select Batch", batch_options)
    update = st.selectbox("Select Update Type", ["Update Batch Name", "Update Batch Timing", "Update Students", "Update Teachers"])

    # Updation of batch name
    if update == "Update Batch Name":
        new_name = st.text_input("Enter New Batch Name")
        if st.button("Update Batch Name"):
            execute_query(f"UPDATE batches SET batch_name = %s WHERE batch_id = %s", (new_name, batch_id))
            st.success("Batch name updated successfully.")

    # Updation of batch timing
    elif update == "Update Batch Timing":
        new_start = st.time_input("Enter New Batch Start Time")
        new_end = st.time_input("Enter New Batch End Time")
        if st.button("Update Batch Timing"):
            execute_query(f"UPDATE batches SET start_time = %s, end_time = %s WHERE batch_id = %s", (new_start, new_end, batch_id))
            st.success("Batch timing updated successfully.")
            updated_batches = fetch(f"SELECT * FROM batches WHERE batch_id = %s", (batch_id,)) # Fetch updated batch details
            if updated_batches:
                updated_batch = updated_batches[0]
                st.text(f"Updated Batch Details: ID: {updated_batch['batch_id']}, Name: {updated_batch['batch_name']}, Timing: {updated_batch['start_time']} - {updated_batch['end_time']}")
            else:
                st.text("Updated Batch Details: Not found")

    # Updation of students in the batch
    elif update == "Update Students":
        students = fetch(f"""
            SELECT s.student_id, s.name
            FROM students s
            JOIN enrollments e ON s.student_id = e.student_id
            WHERE e.batch_id = %s
        """, (batch_id,))
        student_options = [f"{student['student_id']} - {student['name']}" for student in students]
        selected_student = st.selectbox("Select Student to Remove", student_options)
        new_batch_id = st.selectbox("Select New Batch for Student", batch_options)
        if st.button("Move Student to Another Batch"):
            student_id = selected_student.split(" - ")[0]
            execute_query(f"UPDATE enrollments SET batch_id = %s WHERE batch_id = %s AND student_id = %s", (new_batch_id, batch_id, student_id))
            st.success("Student moved to new batch successfully.")
            st.rerun()

    # Updation of teachers in the batch
    elif update == "Update Teachers":
        teachers = fetch(f"""
            SELECT t.teacher_id, t.name
            FROM teachers t
            JOIN batch_teachers bt ON t.teacher_id = bt.teacher_id
            WHERE bt.batch_id = %s
        """, (batch_id,))
        teacher_options = [f"{teacher['teacher_id']} - {teacher['name']}" for teacher in teachers]
        selected_teacher = st.selectbox("Select Teacher to Remove", teacher_options)
        new_batch_id = st.selectbox("Select New Batch for Teacher", batch_options)
        if st.button("Move Teacher to Another Batch"):
            teacher_id = selected_teacher.split(" - ")[0]
            execute_query(f"UPDATE batch_teachers SET batch_id = %s WHERE batch_id = %s AND teacher_id = %s", (new_batch_id, batch_id, teacher_id))
            st.success("Teacher moved to new batch successfully.")
            st.rerun()