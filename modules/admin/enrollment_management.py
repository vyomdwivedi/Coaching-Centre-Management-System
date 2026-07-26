from db import fetch, execute_query
import streamlit as st

def enrollment_management():
    enrollment_option = st.selectbox("Select Enrollment Management Option", ["View Students and Teachers in Batch", "Add New Students and Teachers to Batch", "Remove Students and Teachers from Batch"])

    # View Students and Teachers in Batch
    if enrollment_option == "View Students and Teachers in Batch":
        batches = fetch('SELECT batch_id FROM batches;')
        batch_options = [batch['batch_id'] for batch in batches]
        batch_id = st.selectbox("Select Batch", batch_options)
        students = fetch(f"""
            SELECT 
                s.student_id, 
                s.name
            FROM students s
            JOIN enrollments e ON s.student_id = e.student_id
            WHERE e.batch_id = %s
        """, (batch_id,))
        teachers = fetch(f"""
            SELECT 
                t.teacher_id, 
                t.name
            FROM teachers t
            JOIN batch_teachers bt ON t.teacher_id = bt.teacher_id
            WHERE bt.batch_id = %s
        """, (batch_id,))
        if st.button("View Students in Batch"):
            st.write("Students in Batch:")
            for student in students:
                st.write(f"ID: {student['student_id']}, Name: {student['name']}")
        if st.button("View Teachers in Batch"):
            st.write("Teachers in Batch:")
            for teacher in teachers:
                st.write(f"ID: {teacher['teacher_id']}, Name: {teacher['name']}")

    # Add New Students and Teachers to Batch
    elif enrollment_option == "Add New Students and Teachers to Batch":
        batches = fetch('SELECT batch_id FROM batches;')
        batch_options = [batch['batch_id'] for batch in batches]
        batch_id = st.selectbox("Select Batch", batch_options)
        add_option = st.selectbox("Select Add Option", ["Add Student", "Add Teacher"])
        if add_option == "Add Student":
            student_id = st.text_input("Enter Student ID")
            password = st.text_input("Enter Student Password")
            name = st.text_input("Enter Student Name")
            linked_id = student_id  # Assuming linked_id is the same as student_id for simplicity
            phone = st.text_input("Enter Student Phone Number")
            class_level = st.text_input("Enter Student Class Level")
            admission_date = st.date_input("Enter Admission Date")
            if st.button("Add Student to Batch"):
                execute_query(f"""
                    INSERT INTO creds (user_id, password, role, linked_id, name) 
                    VALUES (%s, %s, 'student', %s, %s)
                """, (student_id, password, linked_id, name))
                execute_query(f"""
                    INSERT INTO students (student_id, name, phone, class_level, admission_date) 
                    VALUES (%s, %s, %s, %s, %s)
                """, (student_id, name, phone, class_level, admission_date))
                execute_query(f"""
                    INSERT INTO enrollments (student_id, batch_id, enrollment_date) 
                    VALUES (%s, %s, %s)
                """, (student_id, batch_id, admission_date))
                st.success("Student added to batch successfully.")
        elif add_option == "Add Teacher":
            teacher_id = st.text_input("Enter Teacher ID")
            password = st.text_input("Enter Teacher Password")
            name = st.text_input("Enter Teacher Name")
            linked_id = teacher_id  # Assuming linked_id is the same as teacher_id for simplicity
            phone = st.text_input("Enter Teacher Phone Number")
            subject = st.selectbox("Select Teacher Subject", ["Math", "Chemistry", "physics"])
            if st.button("Add Teacher to Batch"):
                execute_query(f"""
                    INSERT INTO creds (user_id, password, role, linked_id, name) 
                    VALUES (%s, %s, 'teacher', %s, %s)
                """, (teacher_id, password, linked_id, name))
                execute_query(f"""
                    INSERT INTO teachers (teacher_id, name, subject, phone) 
                    VALUES (%s, %s, %s, %s)
                """, (teacher_id, name, subject, phone))
                execute_query(f"""
                    INSERT INTO batch_teachers (batch_id, teacher_id, subject) 
                    VALUES (%s, %s, %s)
                """, (batch_id, teacher_id, subject))
                st.success("Teacher added to batch successfully.")

    # Remove Students and Teachers from Batch
    elif enrollment_option == "Remove Students and Teachers from Batch":
        batches = fetch('SELECT batch_id FROM batches;')
        batch_options = [batch['batch_id'] for batch in batches]
        batch_id = st.selectbox("Select Batch", batch_options)
        remove_option = st.selectbox("Select Remove Option", ["Remove Student", "Remove Teacher"])
        if remove_option == "Remove Student":
            students = fetch(f"""
                SELECT 
                    s.student_id, 
                    s.name
                FROM students s
                JOIN enrollments e ON s.student_id = e.student_id
                WHERE e.batch_id = %s
            """, (batch_id,))
            student_options = [f"{student['student_id']} - {student['name']}" for student in students]
            selected_student = st.selectbox("Select Student to Remove", student_options)
            if st.button("Remove Student from Batch"):
                student_id = selected_student.split(" - ")[0]
                execute_query(f"""
                    DELETE FROM enrollments 
                    WHERE batch_id = %s AND student_id = %s
                """, (batch_id, student_id))
                st.success("Student removed from batch successfully.")
        elif remove_option == "Remove Teacher":
            teachers = fetch(f"""
                SELECT 
                    t.teacher_id, 
                    t.name
                FROM teachers t
                JOIN batch_teachers bt ON t.teacher_id = bt.teacher_id
                WHERE bt.batch_id = %s
            """, (batch_id,))
            teacher_options = [f"{teacher['teacher_id']} - {teacher['name']}" for teacher in teachers]
            selected_teacher = st.selectbox("Select Teacher to Remove", teacher_options)
            if st.button("Remove Teacher from Batch"):
                teacher_id = selected_teacher.split(" - ")[0]
                execute_query(f"""
                    DELETE FROM batch_teachers 
                    WHERE batch_id = %s AND teacher_id = %s
                """, (batch_id, teacher_id))
                st.success("Teacher removed from batch successfully.")