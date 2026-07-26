from db import fetch
import streamlit as st


def teacher_dashboard():
    st.title("Teacher Dashboard")
    user_id = st.session_state.get("user_id")
    name = st.session_state.get("name")
    if not user_id:
        st.warning("User not authenticated.")
        return
    st.write(f"Welcome, {name}!")

    # Fetch batches where this teacher teaches
    try:
        batches =fetch("""
        SELECT 
            bt.batch_id, 
            b.batch_name, 
            bt.subject AS subject_name
        FROM batch_teachers bt
        JOIN batches b ON bt.batch_id = b.batch_id
        WHERE bt.teacher_id = %s
        ORDER BY bt.batch_id
        """, (user_id,))
    
    except Exception as e:
        st.error(f"Error fetching batches: {e}")
        return

    if not batches:
        st.warning("No batches found for this teacher.")
    else:
        st.subheader("Batches you teach")
        st.dataframe(batches)