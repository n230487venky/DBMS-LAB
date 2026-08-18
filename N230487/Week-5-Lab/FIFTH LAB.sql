#PART-A
use gram_panchayat_db;
show tables;
select *from Citizen;
select *from Certificate_type;
select *from Panchayat_office;
select *from Certificate_Application;

#PART-B
#LEVEL-1
#1
SELECT count(application_id) FROM Certificate_Application;

#2
SELECT count(citizen_id) FROM Citizen;

#3
SELECT count(DISTINCT certificate_name) FROM Certificate_type;

#4
SELECT min(application_date) FROM Certificate_Application;

#5
SELECT max(application_date) FROM Certificate_Application;

#LEVEL-2
#1
SELECT application_status,count(*) 
FROM Certificate_Application
GROUP BY application_status;

#2
SELECT certificate_name,count(*)
FROM Certificate_type
GROUP BY certificate_name;

#3
SELECT purpose,count(*)
FROM Certificate_application
GROUP BY purpose;

#4
SELECT village_name,count(*)
FROM Citizen
GROUP BY village_name;

#5
SELECT MAX(application_date) FROM Certificate_Application;

#LEVEL-2

#1
SELECT application_status, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status;

#2
SELECT certificate_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id;

#3
SELECT office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id;

#4
SELECT village_name, COUNT(*) AS total_citizens
FROM Citizen
GROUP BY village_name;

#5
SELECT application_date, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_date;

#6
SELECT office_id,certificate_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id,office_id;

#7
SELECT C.certificate_name,COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN Certificate_type C
ON A.certificate_id=C.certificate_type_id
GROUP BY C.certificate_name;

#8
SELECT P.office_name,COUNT(*) AS total_applications
FROM Certificate_Application A
JOIN panchayat_office P
ON A.office_id=P.office_id
GROUP BY P.office_name;

#LEVEL-3

#1
SELECT certificate_id,COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id
HAVING COUNT(*)>2;

#2
SELECT office_id,COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id
HAVING COUNT(*)>2;

#3
SELECT certificate_id,COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id
ORDER BY COUNT(*) DESC;

#4

SELECT office_id,COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY office_id
ORDER BY COUNT(*);

#5

SELECT certificate_id,COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id
HAVING COUNT(*)>2
ORDER BY COUNT(*) DESC;

 #6
 
SELECT certificate_id,office_id, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY certificate_id,office_id
ORDER BY COUNT(*) DESC LIMIT 1;

#7

SELECT application_status, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status
ORDER BY COUNT(*) DESC LIMIT 1;

 #8
 
SELECT application_status, COUNT(*) AS total_applications
FROM Certificate_Application
GROUP BY application_status
ORDER BY COUNT(*) ASC LIMIT 1;

