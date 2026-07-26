import streamlit as st
from modules.admin.attendance_management import attendance_management
from modules.admin.batch_management import batch_management
from modules.admin.enrollment_management import enrollment_management
from modules.admin.fee_management import fee_management
from modules.admin.test_management import test_management
from modules.admin.result_management import result_management

from modules.student.student_dashboard import student_dashboard

from modules.teacher.teacher_dashboard import teacher_dashboard

from modules.auth import auth

if not (st.session_state.get("admin") or st.session_state.get("student") or st.session_state.get("teacher")):
    auth()
else:
    if st.session_state.get("admin"):
        st.title("Admin Dashboard")
        menu = ["Batch Management", "Enrollment Management", "Attendance Management", "Fee Management", "Test Management", "Result Management"]
        choice = st.sidebar.selectbox("Select an option", menu)

        if choice == "Batch Management":
            batch_management()
        elif choice == "Enrollment Management":
            enrollment_management()
        elif choice == "Attendance Management":
            attendance_management()
        elif choice == "Fee Management":
            fee_management()
        elif choice == "Test Management":
            test_management()
        elif choice == "Result Management":
            result_management()

        if st.sidebar.button("Logout", key="logout"):
            st.session_state.admin = False
            st.rerun()

    elif st.session_state.get("student"):
        student_dashboard()
        if st.button("Logout", key="logout"):
            st.session_state.student = False
            st.rerun()

    elif st.session_state.get("teacher"):
        teacher_dashboard()
        if st.button("Logout", key="logout"):
            st.session_state.teacher = False
            st.rerun()



st.html("""
    <style>
        .st-key-logout {
            position: absolute;
            bottom: 20px;
            left: 0;
            right: 0;
            padding: 0 20px;
            text-align: center;
        }
    </style>
""")