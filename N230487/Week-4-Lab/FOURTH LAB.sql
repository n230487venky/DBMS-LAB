#PART-A
#1
use gram_panchayat_db;
#2
SHOW TABLES;
#3
SELECT *FROM Citizen;
SELECT *FROM Certificate_Type;
SELECT *FROM Panchayat_office;
SELECT *FROM Certificate_Application;

#PART-B
#Level-1
#TASK-1
SELECT c.full_name,ct.certificate_name
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id=ct.certificate_type_id;

#TASK-2
SELECT c.full_name,po.office_name
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id
INNER JOIN Panchayat_Office po ON ca.office_id=po.office_id;

#TASK-3
SELECT ca.application_id,c.full_name,ca.application_status
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id;

#TASK-4
SELECT c.full_name,ct.certificate_name,ca.application_date
FROM Citizen c
INNER JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id=ct.certificate_type_id;

#TASK-5
SELECT ca.application_id,c.full_name,ct.certificate_name, po.office_name,ca.application_status
FROM Certificate_Application ca
INNER JOIN Citizen c ON ca.citizen_id=c.citizen_id
INNER JOIN Certificate_Type ct ON ca.certificate_id=ct.certificate_type_id
INNER JOIN Panchayat_Office po ON ca.office_id=po.office_id;

#Level-2
#Task-6
SELECT c.full_name,po.office_name
FROM Certificate_Application ca
JOIN Citizen c ON ca.citizen_id=c.citizen_id
JOIN Certificate_Type ct ON ca.certificate_id=ct.certificate_type_id
JOIN Panchayat_Office po ON ca.office_id=po.office_id
WHERE ct.certificate_name='Income Certificate';

#Task-7
SELECT ca.*,c.*
FROM Certificate_Application ca
JOIN Citizen c ON ca.citizen_id=c.citizen_id
JOIN Panchayat_Office po ON ca.office_id=po.office_id
WHERE po.office_name='Ramapuram Gram Panchayat';

#Task-8
SELECT ca.application_id,ct.description,ca.application_status
FROM Certificate_Application ca
JOIN Certificate_Type ct ON ca.certificate_id=certificate_type_id;

#Task-9
SELECT c.full_name,c.village_name,ct.certificate_name,po.office_name,ca.application_date
FROM Certificate_Application ca
JOIN Citizen c ON ca.citizen_id=c.citizen_id
JOIN Certificate_type ct ON ca.certificate_id=ct.certificate_type_id
JOIN Panchayat_office po ON po.office_id=ca.office_id;

#Task-10
SELECT c.*,ct.*,po.*,ca.*
FROM Certificate_Application ca
JOIN Citizen c ON ca.citizen_id=c.citizen_id
JOIN Certificate_Type ct ON ca.certificate_id=ct.certificate_type_id
JOIN Panchayat_Office po ON ca.office_id=po.office_id;

#Level-3
#Task-11
SELECT c.full_name,ca.application_id,ca.application_status
FROM Citizen c
LEFT JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id;

#Task-12
SELECT ct.certificate_name,ca.application_id
FROM Certificate_Application ca
RIGHT JOIN Certificate_type ct ON ct.certificate_type_id=ca.certificate_id;

#Task-13
SELECT c.full_name,ca.application_id
FROM Citizen c
LEFT JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id

UNION

SELECT c.full_name,ca.application_id
FROM Citizen c
RIGHT JOIN Certificate_Application ca ON c.citizen_id=ca.citizen_id;

#Task-14

SELECT c.full_name,ct.certificate_name
FROM Citizen c
CROSS JOIN Certificate_type ct;

#Task-15
SELECT c1.full_name , c1.village_name FROM citizen c1 JOIN citizen c2 ON c1.citizen_id = c2.citizen_id ;