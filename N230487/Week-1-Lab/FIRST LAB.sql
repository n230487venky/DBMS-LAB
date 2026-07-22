show databases;
create database gram_panchayat_db;
use  gram_panchayat_db;
create table Citizen(citizen_id int primary key,full_name varchar(100) Not Null,date_of_birth date not null,gender varchar(10) not null,mobile_number varchar(15) unique not null,occupation varchar(50),village_name varchar(50) not null,is_active boolean not null);
show tables;
insert into Citizen values(101,'Ravikumar','1995-06-15','Male',9876500001,'Farmer','Ramapuram',TRUE);
insert into Citizen values(102,'Laksmidevi','1988-11-22','Female',9876500002,'Tailor','Ramapuram',TRUE);
insert into Citizen values(103,'Suresh babu','1992-03-10','Male',9876500003,'Shopkeeper','Seetampeta',TRUE);
insert into Citizen values(104,'Anjali rao','2000-08-05','Female',9876500004,'Student','Ramapuram',TRUE);
insert into Citizen values(105,'Kiran kumar','1985-01-18','Male',9876500005,'Electrician','Seetampeta',TRUE);
insert into Citizen values(106,'Meena kumari','1998-12-30','Female',9876500006,'Teacher','Lakhmipuram',TRUE);
select *from Citizen;
create table Certificate_type(certificate_type_id int primary key,certificate_name varchar(100) unique not null,description varchar(200) not null,processing_days int not null,application_fee decimal(8,2) not null,is_available boolean not null);
insert into Certificate_type values(1,'Residence Certificate','Certifies the declared place of residence',7,30.00,TRUE);
insert into Certificate_type values(2,'Birth Record Request','Request for a locally maintained birth record',5,20.00,TRUE);
insert into Certificate_type values(3,'Death Record Request','Request for a locally maintained death record',5,20.00,TRUE);
insert into Certificate_type values(4,'Family Member certificate','Records declared family-member information',10,40.00,TRUE);
insert into Certificate_type values(5,'Property Certificate','Certificate related to locally maintained propertyrecords',15,50.00,TRUE);
insert into Certificate_type values(6,'No-Dues Certificate','Indicates applicable local dues status',7,25.00,FALSE);
select *from Certificate_type;
create table Certificate_Application(application_id int primary key,citizen_id int not null,certificate_name varchar(100) not null,application_date date not null,purpose varchar(200) not null,application_status varchar(30) not null,fee_paid decimal(8,2) not null,reference_number varchar(30) unique not null);
insert into Certificate_Application values(1001,101,'Residence Certificate','2026-06-01','Bank Account Documentation','Submitted',30.00,'GP20260001');
insert into Certificate_Application values(1002,102,'FamilyMember Certificate','2026-07-02','WelfareSchemeapplication','Under Review',40.00,'GP20260002');
insert into Certificate_Application values(1003,103,'Property Certificate','2026-07-03','Property Documentation','Submitted',50.00,'GP20260003');
insert into Certificate_Application values(1004,104,'Residence Certificate','2026-07-04','College Admission','Approved',30.00,'GP20260004');
insert into Certificate_Application values(1005,105,'No-Dues Certificate','2026-07-05','Localservice requirement','Under Review',25.00,'GP20260005');
insert into Certificate_Application values(1006,106,'Birth Record Request','2026-07-06','Personal Documentation','Rejected',20.00,'GP20260006');
select *from Certificate_Application;
create table Panchayat_office(office_id int primary key,office_name varchar(100) not null,village_name varchar(50) not null,pincode varchar(6) not null,contact_number varchar(15) unique,office_email varchar(100) unique,opening_time time not null,is_operational boolean not null);
insert into Panchayat_office values(1,'Ramapuram GramPanchayat','Ramapuram','521101','086600001','ramapuram@gp.example','09:00:00',true);
insert into Panchayat_office values(2,'Seethampeta GramPanchayat','Seethampeta','521102','086600002','seethampeta@gp.example','09:30:00',true);
insert into Panchayat_office values(3,'Lakshmipuram GramPanchayat','Lakshmipuram','521103','086600003','Lakshmipuram@gp.example','09:00:00',true);
insert into Panchayat_office values(4,'Krishnapuram GramPanchayat','Krishnapuram','521104','086600004','krishnapuram@gp.example','10:00:00',true);
insert into Panchayat_office values(5,'Venkatapuram GramPanchayat','Venkatapuram','521105','086600005','venkatapuram@gp.example','09:30:00',true);
insert into Panchayat_office values(6,'Gopalapuram GramPanchayat','Gopalapuram','521106','086600006','Gopalapuram@gp.example','09:00:00',false);
select *from Panchayat_office;
INSERT INTO `gram_panchayat_db`.`Citizen` (`citizen_id`, `full_name`, `date_of_birth`, `gender`, `mobile_number`, `occupation`, `village_name`, `is_active`) VALUES ('107', 'Venkatesh', '2006-01-02', 'Male', '7013468516', 'Student', 'Angallu', '1');
insert into `gram_panchayat_db`.`Certificate_type` (`certificate_type_id`, `certificate_name`, `description`, `processing_days`, `application_fee`, `is_available`) VALUES ('7', 'Income Ceritficate', 'Indicates the income of family', '7', '50.00', '1');
update `gram_panchayat_db`.`Certificate_Application` set `application_status` = 'Under Review' where (`application_id` = '1001');
update `gram_panchayat_db`.`Certificate_Application` set `application_status` = 'Approved' where (`application_id` = '1002');
update `gram_panchayat_db`.`Citizen` set `occupation` = 'Electrical Technician' where (`citizen_id` = '105');
update `gram_panchayat_db`.`Citizen` set `occupation` = 'Electrical Technician' where (`citizen_id` = '105');
update `gram_panchayat_db`.`Citizen` set `occupation` = 'Electrical Technician' where (`citizen_id` = '105');
delete from Citizen where citizen_id=107;

alter table Citizen add address varchar(50);
alter table Certificate_Application add issued_date date;
alter table Panchayat_office add closing_time time;

create table Temporary_Request(request_id int primary key,request_name varchar(30)not null,request_date date not null);
insert into Temporary_Request values(487,'venkatesh','2026-06-02');
insert into Temporary_Request values(711,'hemanth','2026-06-04');
insert into Temporary_Request values(129,'pavan','2026-06-06');
select *from Temporary_Request;
truncate table Temporary_Request;
drop table Temporary_Request;

insert into `gram_panchayat_db`.`Citizen` (`citizen_id`, `full_name`, `date_of_birth`, `gender`, `mobile_number`, `occupation`, `village_name`, `is_active`) values ('101', 'Hemanth kumari', '2007-11-29', 'Female', '9876543210', 'Student', 'pitapuram', '1');
#Error Code: 1062. Duplicate entry '101' for key 'citizen.PRIMARY'
insert into `gram_panchayat_db`.`Citizen` (`citizen_id`, `full_name`, `date_of_birth`, `gender`, `mobile_number`, `occupation`, `village_name`, `is_active`) values ('107', 'Hema', '2007-11-29', 'Female', '9876500001', 'Student', 'Pitapuram', '1');
#Error Code: 1062. Duplicate entry '9876500001' for key 'citizen.mobile_number'
insert into `gram_panchayat_db`.`Certificate_type` (`certificate_type_id`, `description`, `processing_days`, `application_fee`, `is_available`) values ('8', 'Indicates the certificate', '10', '40.00', '1');
#Error Code: 1364. Field 'certificate_name' doesn't have a default value
insert into`gram_panchayat_db`.`Certificate_Application` (`application_id`, `citizen_id`, `certificate_name`, `application_date`, `purpose`, `application_status`, `fee_paid`, `reference_number`) values ('1007', '107', 'Caste Certificate', '2026-07-19', 'Caste Document ', 'UnderReview', '20.00', 'GP20260001');
#Error Code: 1062. Duplicate entry 'GP20260001' for key 'certificate_application.reference_number'




