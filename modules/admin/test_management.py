from db import fetch, execute_query
import streamlit as st

def test_management():
    batches = fetch('SELECT batch_id FROM batches;')
    batch_options = [batch['batch_id'] for batch in batches]
    batch_id = st.selectbox("Select Batch", batch_options)
    subject = st.selectbox("Select Subject",["Maths", "Physics", "Chemsitry"])
    test_name = st.text_input("Test Name")
    date = st.date_input("Select Date")
    max_marks = st.number_input("Max Marks", min_value=1, max_value=100, value=50)
    if st.button("Create Test"):
        if not test_name:
            st.error("Please enter a test name.")
            return
        execute_query("""
            INSERT INTO tests (batch_id, subject, test_name, test_date, max_marks)
            VALUES (%s, %s, %s, %s, %s)
        """,(batch_id, subject, test_name, date, max_marks))
        st.success("Test added.")