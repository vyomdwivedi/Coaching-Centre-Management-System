from db import fetch
import streamlit as st

def student_dashboard():
    st.title("Student Dashboard")
    user_id = st.session_state.get("user_id")
    name = st.session_state.get("name")
    if not user_id:
        st.warning("User not authenticated.")
        return

    st.write(f"Welcome, {name}!")

    try:
        batch = fetch("""
            SELECT
                e.batch_id,
                b.batch_name,
                b.start_time,
                b.end_time,
                e.enrollment_date
            FROM enrollments e
            JOIN batches b ON b.batch_id = e.batch_id
            WHERE e.student_id = %s
            ORDER BY e.enrollment_date DESC, e.batch_id
            """,(user_id,))
    except Exception as e:
        st.error(f"Failed to load batch details: {e}")
        batch = None

    try:
        fee = fetch("""
            SELECT
                f.fee_id,
                f.amount,
                f.due_date,
                f.payment_date,
                f.status
            FROM fees f
            WHERE f.student_id = %s
            ORDER BY f.due_date DESC, f.fee_id DESC
            """,(user_id,))
    except Exception as e:
        st.error(f"Failed to load fee status: {e}")
        fee = None

    try:
        attendance_records = fetch("""
            SELECT
                a.attendance_date,
                a.batch_id,
                b.batch_name,
                a.status
            FROM attendance a
            JOIN batches b ON b.batch_id = a.batch_id
            WHERE a.student_id = %s
            ORDER BY a.attendance_date DESC, a.batch_id
            """,(user_id,))
    except Exception as e:
        st.error(f"Failed to load attendance records: {e}")
        attendance_records = None

    try:
        test_result = fetch("""
            SELECT
                r.test_id,
                t.test_name,
                t.subject,
                t.test_date,
                r.marks_obtained,
                t.max_marks,
                ROUND((r.marks_obtained / t.max_marks) * 100, 2) AS percentage
            FROM results r
            JOIN tests t ON t.test_id = r.test_id
            WHERE r.student_id = %s
            ORDER BY t.test_date DESC, r.test_id DESC
            """,(user_id,))
    except Exception as e:
        st.error(f"Failed to load test results: {e}")
        test_result = None

    try:
        test = fetch("""
            SELECT
                t.test_id,
                t.test_name,
                t.subject,
                t.test_date,
                t.max_marks,
                t.batch_id,
                b.batch_name
            FROM tests t
            JOIN enrollments e ON e.batch_id = t.batch_id
            JOIN batches b ON b.batch_id = t.batch_id
                        WHERE e.student_id = %s
              AND t.test_date >= CURDATE()
            ORDER BY t.test_date, t.test_id
            """,(user_id,))
    except Exception as e:
        st.error(f"Failed to load upcoming tests: {e}")
        test = None

    st.subheader("Batch Details")
    if batch:
        st.dataframe(batch)
    else:
        st.info("No batch details found.")

    st.subheader("Fees Status")
    if fee:
        st.dataframe(fee)
    else:
        st.info("No fees status found.")

    st.subheader("Attendance")
    if attendance_records:
        st.dataframe(attendance_records)
    else:
        st.info("No attendance records found.")

    st.subheader("Test Results")
    if test_result:
        st.dataframe(test_result)
    else:
        st.info("No test results found.")

    st.subheader("Upcoming Tests")
    if test:
        st.dataframe(test)
    else:
        st.info("No upcoming tests found.")