CREATE DATABASE IF NOT EXISTS hospital_system;

USE hospital_system;

CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    cabinet VARCHAR(50),
    specialization VARCHAR(50),
    health_insurance BOOLEAN,
    phone VARCHAR(10),
    email VARCHAR(100)
);

CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    egn VARCHAR(10) NOT NULL,
    diagnosis VARCHAR(100),
    treatment TEXT,
    medications TEXT,
    treatment_period VARCHAR(50),
    doctor_id INT,
    FOREIGN KEY (doctor_id) 
		REFERENCES doctors(id)
);

-- Populate doctors table
INSERT INTO doctors (first_name, middle_name, last_name, cabinet, specialization, health_insurance, phone, email) 
VALUES
	('Иван', 'Савов', 'Иванов', '25 ДКЦ - етаж 2, стая 201', 'Общопрактикуващ лекар (GP)', true, '0887111855', 'ivanivanov@example.com'),
	('Виктория', 'Стаменова', 'Тодорова', 'Студентска поликлиника - етаж 3, стая 320', 'Дерматолог', true, '0877123668', 'viktoriatodorova@example.com'),
	('Андрей', 'Димитров', 'Петков', 'Окръжна болница - етаж 2, стая 208', 'Кардиолог', false, '0897412588', 'andreypetkov@example.com');

-- Populate patients table
INSERT INTO patients (first_name, middle_name, last_name, address, egn, diagnosis, treatment, medications, treatment_period, doctor_id) 
VALUES
	('Михаил', 'Петров', 'Иванов', 'София, ул. България №1', '1234567890', 'Хипертония', 'Лечение с медикаменти', 'Аспирин', '1 месец', 1),
	('Мария', 'Георгиева', 'Василева', 'София, бул. Васил Левски №2', '2345678901', 'Диабет', 'Инсулинова терапия', 'Инсулин', '3 месеца', 2),
	('Петър', 'Иванов', 'Николов', 'Варна, ул. Славянска', '3456789012', 'Астма', 'Инхалатори', 'Вентолин', '2 седмици', 3);
