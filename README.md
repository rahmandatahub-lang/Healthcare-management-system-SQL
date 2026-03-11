***Healthcare Management System***
**Project Overview**

The Healthcare Management System project analyzes hospital operational and financial data using SQL. The system manages key healthcare entities such as patients, doctors, appointments, treatments, and billing records.

The objective is to perform SQL-based data analytics to generate meaningful insights that can help hospital management improve operational efficiency, monitor doctor workload, and analyze hospital revenue performance.

***Project Objectives***
Design a relational healthcare database to manage hospital data including patients, doctors, appointments, treatments, and billing records.
Perform SQL-based data analysis using joins, aggregate functions, and subqueries to extract meaningful insights.
Analyze patient visit patterns, doctor workload, and hospital operational efficiency.
Evaluate hospital revenue and payment status to understand financial performance.
Support data-driven decision-making through analytical insights and dashboard visualization.

***Dataset Tables***
Table Name	Description
patients	Stores patient personal and registration details
doctors	Stores doctor information and specialization
appointments	Tracks patient-doctor appointments
treatments	Stores diagnosis and treatment cost
bills	Maintains billing and payment details
Tools & Technologies

Database: MySQL
IDE: MySQL Workbench
Language: SQL
Visualization: Microsoft Excel / Power BI

Version Control: Git & GitHub
Key SQL Concepts Used

SELECT, WHERE, ORDER BY

INNER JOIN, LEFT JOIN

GROUP BY, HAVING

Aggregate Functions (COUNT, SUM, AVG, MAX)

Subqueries

Date Functions (MONTH, YEAR)

NULL Handling

***Key Insights***
1. Doctor Workload Distribution
Some doctors handle significantly more appointments than others, indicating uneven workload distribution.

2. Revenue Contribution by Specialization
Certain medical specializations generate higher treatment revenue, contributing significantly to hospital income.

3. Monthly Revenue Trends
Hospital revenue fluctuates across months, helping identify high-demand periods for treatments and consultations.

4. Payment Status Analysis
A portion of hospital bills remain pending or unpaid, which may affect hospital cash flow.

5. Repeat Patient Visits
Several patients visit the hospital multiple times, indicating ongoing treatments and patient retention.

***SQL Queries for Business Insights***
1. Doctor-wise Number of Appointments
SELECT d.doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;

3. Month-wise Hospital Revenue
SELECT MONTH(b.bill_date) AS month, SUM(b.amount) AS total_revenue
FROM bills b
GROUP BY month
ORDER BY month;

5. Revenue by Doctor Specialization
SELECT d.specialization, SUM(t.treatment_cost) AS total_revenue
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.specialization
ORDER BY total_revenue DESC;

7. Payment Status Analysis
SELECT payment_status, COUNT(*) AS total_bills
FROM bills
GROUP BY payment_status;

9. Repeat Patient Visits
SELECT p.patient_name, COUNT(a.appointment_id) AS visit_count
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING visit_count > 1;
Exploratory Data Analysis (EDA)

Data exploration was performed using Excel and SQL:

Checked for missing values

Removed duplicate records

Formatted date columns

Created pivot tables for analysis

Dashboard & Visualization

Dashboard visuals created in Excel / Power BI:

Analysis	Chart Type
Doctor workload	Bar Chart
Monthly revenue	Line Chart
Revenue by specialization	Bar Chart
Payment status	Pie Chart
Repeat patients	Bar Chart

Additional features:

Interactive filters

Slicers
KPI metrics
Business Impact
This project demonstrates how SQL-based healthcare analytics can help hospitals:
Monitor doctor performance

Analyze patient visit patterns

Track hospital revenue trends

Improve billing and payment management

Support data-driven healthcare decisions
