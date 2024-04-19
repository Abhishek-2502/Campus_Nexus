-- FUNCTIONS
-- 1
DELIMITER $$
CREATE FUNCTION calculate_average_grade(p_prn INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE v_avg_grade FLOAT;
    SELECT (MidSem + EndSem) / 2 INTO v_avg_grade FROM Grades WHERE PRN = p_prn;
    RETURN v_avg_grade;
END$$
DELIMITER ;

SELECT calculate_average_grade(1001) AS avgerage;


-- 2
DELIMITER $$
CREATE FUNCTION get_student_grade_status(p_prn INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE v_grade_status VARCHAR(10);
    DECLARE v_avg_grade FLOAT;
    SELECT calculate_average_grade(p_prn) INTO v_avg_grade FROM DUAL;

    IF v_avg_grade >= 60 THEN
        SET v_grade_status = 'Pass';
    ELSE
        SET v_grade_status = 'Fail';
    END IF;

    RETURN v_grade_status;
END $$
DELIMITER ;

SELECT get_student_grade_status(1005) AS Grade;


-- PROCEDURE
-- 1
DELIMITER //
CREATE PROCEDURE add_new_faculty(
    IN p_faculty_id INT,
    IN p_faculty_name VARCHAR(50),
    IN p_branch_id INT)
BEGIN
    INSERT INTO Faculty (FacultyID, FacultyName, BranchID)
    VALUES (p_faculty_id, p_faculty_name, p_branch_id);
END //
DELIMITER ;

CALL add_new_faculty(119,'Dr.lakshya',5006);
SELECT * FROM faculty;

-- 2
DELIMITER //
CREATE PROCEDURE get_student_name(
    IN p_prn INT,
    OUT p_first_name VARCHAR(50),
    OUT p_last_name VARCHAR(50))
BEGIN
    SELECT FirstName, LastName
    INTO p_first_name, p_last_name
    FROM Student
    WHERE PRN = p_prn;
END //
DELIMITER ;

CALL get_student_name(1001, @first_name, @last_name);
SELECT @first_name, @last_name;




-- TRIGGERS
-- 1
CREATE TABLE StudentAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    PRN INT,
    LastModified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (PRN) REFERENCES Student(PRN)
);

DROP TRIGGER student_update_trigger;
DELIMITER //
CREATE TRIGGER student_update_trigger
BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO StudentAudit (PRN) VALUES (NEW.PRN);
END //
DELIMITER ;


UPDATE Student SET firstname="Abhishek" WHERE prn=1001;
SELECT * FROM StudentAudit;



-- 2
DROP TRIGGER validate_email_format_trigger;
DELIMITER //
CREATE TRIGGER validate_email_format_trigger
BEFORE INSERT ON Admin
FOR EACH ROW
BEGIN
    IF NEW.Email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format.';
    END IF;
END //
DELIMITER ;

INSERT INTO Admin VALUES( 5, 'Raj', 'More', 'sneha@gmail|[]/.com');



