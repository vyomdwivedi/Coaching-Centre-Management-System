from db import fetch
import streamlit as st
import time

def auth():
    creds = fetch("SELECT * FROM creds")
    st.session_state.admin = False
    st.session_state.student = False
    st.session_state.teacher = False
    st.title("User Login")
    st.session_state.user_id = st.text_input("Username").strip()
    password = st.text_input("Password", type="password").strip()
    if st.button("Login"):
        found = False
        for cred in creds:
            if st.session_state.user_id == cred['user_id'] and password == cred['password']:
                st.session_state.name = cred['name']
                found = True
                if cred['role'] == 'admin':
                    st.session_state.admin = True
                    st.session_state.student = False
                    st.session_state.teacher = False
                    st.success("Login successful! Welcome, Admin.")
                elif cred['role'] == 'student':
                    st.session_state.student = True
                    st.session_state.admin = False
                    st.session_state.teacher = False
                    st.success(f"Login successful! Welcome, {cred['name']}.")
                elif cred['role'] == 'teacher':
                    st.session_state.teacher = True
                    st.session_state.admin = False
                    st.session_state.student = False
                    st.success(f"Login successful! Welcome, {cred['name']}.")
                time.sleep(1)
                st.rerun()
                break
        
        if not found:
            st.error("Invalid username or password. Please try again.")
    st.info("Don't have an account? Please contact the administrator to create one.")
    st.warning("Note: For security reasons, please do not share your login credentials with anyone.")
