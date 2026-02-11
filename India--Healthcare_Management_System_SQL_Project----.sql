
-- HEALTHCARE MANAGEMENT SYSTEM DATABASE
CREATE DATABASE INDIA_HEALTHCARE;
USE INDIA_HEALTHCARE;

-- PATIENTS TABLE
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    city VARCHAR(50),
    registration_date DATE
);

-- SAMPLE DATA
INSERT INTO patients VALUES
(1,'Rahul','Sharma','Male',32,'9876543210','Delhi','2023-01-10'),
(2,'Anita','Verma','Female',28,'9876543220','Mumbai','2021-02-12'),
(3,'Kiran','Reddy','Male',25,'9876543230','Hyderabad','2020-03-18'),
(4,'Adam','arman','Male',33,'987654898','Nizamabad','2019-09-18'),
(5,'Kiran','kumar','Male',26,'98765432322','Warangal','2023-09-18'),
(6,'laxman','Reddy','Male',35,'9876542121','Delhi','2018-06-22'),
(7,'ajay','rayudu','Male',55,'9876543444','Hyderabad','2025-05-12'),
(8,'vijaya','munnuru','Male',43,'9876534234','Pune','2023-03-18'),
(9,'ramesh','puppala','Male',49,'987654369832','madhya-pradesh','2022-03-18'),
(10,'ramya','battula','FeMale',30,'9876555697','sikkim','2021-03-12'),
(11,'vinathi','bachewal','FeMale',31,'93465423699','banglore','2021-03-14'),
(12,'amulya','laxman','FeMale',29,'98765435437','chennai','2020-03-11'),
(13,'rana','daggupati','Male',41,'9876543432','bihar','2020-03-19'),
(14,'chaintanya','akkieneni','Male',38,'9876543994','Hyderabad','2022-03-08');

select * from patients;

-- DOCTORS TABLE
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    experience_years INT,
    consultation_fee DECIMAL(10,2)
);
select * from doctors;
INSERT INTO doctors VALUES
(101,'Dr. Mehta','Cardiology',12,800),
(102,'Dr. Khan','Orthopedics',9,700),
(103,'Dr. Iyer','Neurology',11,1200),
(104,'Dr. srinivas','gastro',19,2000),
(105,'Dr. ravi','general-physicion',8,1000),
(106,'Dr. kiran','Neprology',5,1000),
(107,'Dr. suresh','heptology',17,2000),
(108,'Dr. ramya','physio-bpt',11,1000),
(109,'Dr. khan','dermatoligist',25,3000);

select * from doctors;

-- APPOINTMENTS TABLE
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
select * from Appointments;
INSERT INTO appointments VALUES
(1001,1,101,'2023-04-10','Completed'),
(1002,2,102,'2023-04-11','Completed'),
(1003,1,102,'2023-04-12','Cancelled'),
(1004,2,102,'2022-06-12','Cancelled'),
(1005,2,103,'2021-02-12','Cancelled'),
(1006,3,103,'2021-04-12','Cancelled'),
(1007,3,104,'2026-02-12','Pending'),
(1008,4,104,'2023-04-12','Cancelled'),
(1009,4,105,'2026-02-13','Pending'),
(1010,4,104,'2023-02-08','Cancelled');

select * from Appointments;
-- TREATMENTS TABLE
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    diagnosis VARCHAR(200),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);
INSERT INTO treatments VALUES
(201,1001,'Heart Checkup',5000),
(202,1002,'Knee Pain Treatment',3000);

select * from treatments;

CREATE TABLE bills (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    bill_date DATE,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

select * from bills;

INSERT INTO bills VALUES
(301,1,201,'2023-04-10',5800,'Paid'),
(302,2,202,'2023-04-11',3700,'Pending');
select * from bills;

##---🔹 Basic Queries

select * from patients;
select * from bills;
select * from treatments;
select * from doctors;

##----1.Get all patients
select * from patients;

###-----2.List all doctors and their specialization

select Doctor_name,specialization from doctors;

####3.Show all appointments

select * from appointments;

###......4-Count total patients

select * from patients;

select count(patient_id) from patients;

###------5.Find distinct cities of patients

select distinct city from patients;

####-Advance-Level-Questions---

#-----6.Total revenue generated
select * from bills;
select sum(total_amount) as total_revenue from bills;

###------7.Pending bills
select * from bills;

select * from bills where payment_status  ='pending';


###---------8..Number of appointments per doctor

select * from doctors;
select * from appointments;

SELECT 
    doctors.doctor_id,
    doctors.doctor_name,
    doctors.specialization,
    appointments.appointment_id,
    appointments.appointment_date
FROM doctors
INNER JOIN appointments
ON doctors.doctor_id = appointments.doctor_id;


###------9.Patients who cancelled appointments
select * from patients;
select * from appointments;

select patients.patient_id,
patients.first_name,
patients.last_name,
patients.city,
appointments.appointment_id,
appointments.appointment_date,
appointments.status
from patients
inner join appointments
on patients.patient_id = appointments.patient_id;

select * from appointments where status='cancelled';

#####--10.Average treatment cost

select * from bills;
select * from treatments;

select avg(treatment_cost) from treatments;

###---------Advanced / Interview Queries

####..11------Top earning doctor

select * from doctors;

SELECT 
    doctor_id,
    doctor_name,
    specialization,
    consultation_fee
FROM doctors
ORDER BY consultation_fee DESC
LIMIT 1;


###---12..Patients who visited more than once
select * from appointments;
select * from patients;

SELECT 
    patients.patient_id,
    patients.first_name,
    patients.last_name,
    patients.registration_date,
    COUNT(appointments.appointment_id) AS total_visits
FROM patients 
INNER JOIN appointments 
ON patients.patient_id = appointments.patient_id
GROUP BY 
    patients.patient_id,
    patients.first_name,
    patients.last_name,
    patients.registration_date
HAVING COUNT(appointments.appointment_id) > 1;


##----13..Revenue per specialization

select * from bills;
select * from appointments;
select * from doctors;
select * from treatments;
use india_healthcare;

SELECT
    doctors.specialization,
    SUM(treatments.treatment_cost) AS total_revenue
FROM doctors 
INNER JOIN appointments 
    ON doctors.doctor_id = appointments.doctor_id
INNER JOIN treatments 
    ON appointments.appointment_id = treatments.appointment_id
GROUP BY doctors.specialization;


#####---14..Month-wise revenue
SELECT 
    MONTH(bill_date) AS month_number,
    SUM(total_amount) AS total_revenue
FROM bills
GROUP BY MONTH(bill_date)
ORDER BY month_number;


###--15...Doctors with no appointments

select * from appointments;
select * from doctors;

select doctors.doctor_id,
doctors.doctor_name,
doctors.specialization,
appointments.appointment_id,
appointments.appointment_date,
appointments.status
from doctors
left join appointments
on doctors.doctor_id=appointments.doctor_id
WHERE appointments.appointment_id IS NULL;
















