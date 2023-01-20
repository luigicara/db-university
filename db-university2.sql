-- GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date), COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT teachers.office_address, COUNT(*) 
FROM teachers
GROUP BY teachers.office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT exam_id, AVG(exam_student.vote) as "voto_medio"
FROM exam_student
GROUP BY exam_id
ORDER BY voto_medio DESC;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT departments.name, COUNT(*) as 'degrees'
FROM degrees
	JOIN departments
    	ON degrees.department_id = departments.id
GROUP BY departments.name;

-- JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT degrees.name as 'degree', students.*
FROM students
    JOIN degrees
        ON students.degree_id = degrees.id
WHERE students.degree_id = 53;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT degrees.name, departments.name
FROM degrees
	JOIN departments
    	ON degrees.department_id = departments.id
WHERE departments.name LIKE '%neuroscienze%'
AND degrees.level = 'magistrale';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT courses.name as 'courses_name', teachers.name, teachers.surname
FROM course_teacher
	JOIN teachers
    	ON course_teacher.teacher_id = teachers.id
    JOIN courses
    	ON course_teacher.course_id = courses.id
WHERE teachers.id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT *
    FROM students
        JOIN degrees
            ON students.degree_id = degrees.id
        JOIN departments
            ON departments.id = degrees.id
    ORDER BY students.surname, students.name;