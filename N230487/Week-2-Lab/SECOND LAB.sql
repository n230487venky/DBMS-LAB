USE gram_panchayat_db;
SHOW TABLES;
SELECT *FROM Citizen;
#LEVEL 1(B)
SELECT upper(full_name) FROM Citizen;
SELECT lower(village_name) FROM Citizen;
SELECT length(full_name) FROM Citizen;
SELECT substring(reference_number,1,4) FROM Certificate_Application;
SELECT concat(full_name,'-',village_name) FROM Citizen;
SELECT *FROM Certificate_Application;
#LEVEL 2(B)
SELECT replace(certificate_name,'Certificate','Cert.') from Certificate_Application;
SELECT ltrim(rtrim(certificate_name)) FROM Certificate_Application;
SELECT substring(Full_name,1,instr(Full_name,' ')) AS Full_name FROM Citizen;
#LEVEL 3(B)
SELECT concat('Citizen:',Full_name,',','Village_name:',village_name) AS details FROM Citizen;
SELECT *FROM Certificate_Application WHERE left(Reference_number,6)='GP2026';
SELECT *FROM Certificate_Type;
#LEVEL 1(C)
SELECT round(fee_paid) FROM Certificate_Application;
SELECT abs(-10) FROM Certificate_Type WHERE processing_days=10;
SELECT power(processing_days,2) FROM Certificate_Type;
#LEVEL 2(C)
SELECT mod(processing_days,3) AS Remainder FROM Certificate_Type;
SELECT round(application_fee,1) AS onedecimal FROM Certificate_type;
SELECT floor(application_fee),floor(application_fee) FROM Certificate_Type;
#LEVEL 3(C)
SELECT round(rand()*100) AS random; 
SELECT sqrt(processing_days) AS sqrt FROM Certificate_Type;
SELECT (processing_days*2) AS multiplication FROM Certificate_Type;
#LEVEL 1(D)
SELECT curdate();
SELECT current_date(),current_time();
SELECT year(application_date) FROM Certificate_Application;
SELECT month(application_date) FROM Certificate_Application;
SELECT day(application_date) FROM Certificate_Application;
#LEVEL 2(D)
SELECT concat(application_id ) as application_id ,concat(citizen_id)as citizen_id,date_add(application_date, interval processing_days day) as issued_date from certificate_application,certificate_type;
SELECT date_add(application_date,INTERVAL 30 DAY) AS adding_30days FROM Certificate_Application;
SELECT date_sub(application_date,INTERVAL 7 DAY) AS sub_7days FROM Certificate_Application;
#LEVEL 3(D)
SELECT application_id,application_date,datediff(CURDATE(),application_date) AS days_difference FROM Certificate_Application;
SELECT *FROM Certificate_Application WHERE YEAR(application_date)=YEAR(CURDATE());
#LEVEL 1(E)
SELECT CAST(fee_paid AS signed)AS fee_paid_int FROM Certificate_Application;
SELECT CAST(processing_days AS CHAR)AS processing_days_char FROM Certificate_Type;
#LEVEL 2(E)
SELECT CAST(application_date AS DATETIME) FROM Certificate_Application;
SELECT CONVERT(processing_days, DECIMAL(10,2)) FROM Certificate_Type;
#LEVEL 3(E)
SELECT CAST(application_fee AS char)AS converted_char FROM Certificate_Type;
SELECT CAST('12.3' AS decimal)+23.6 AS addition;

