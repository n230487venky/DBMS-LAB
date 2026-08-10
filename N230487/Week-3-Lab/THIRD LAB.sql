#PART A
use gram_panchayat_db;
show tables;
select *from Citizen;
select *from Certificate_Type;
select *from Certificate_Application;
select *from Panchayat_office;
#PART B
#1
alter table Certificate_Application drop certificate_name;
#2
alter table Certificate_Application add certificate_id int , add office_id int ;
#3
update Certificate_Application ca , Certificate_Type ct set ca.certificate_id = ct.certificate_type_id where ca.certificate_name = ct.certificate_name;
update Certificate_Application ca , Panchayat_office po , citizen c set ca.office_id = po.office_id where c.village_name = po.village_name and ca.citizen_id=c.citizen_id;
#4
alter table Certificate_Application add constraint fk_citizen foreign key(citizen_id) references Citizen(citizen_id), add constraint fk_certificate foreign key(certificate_id) references Certificate_Type(certificate_type_id), add constraint fk_office foreign key(office_id) references Panchayat_office(office_id);
#5
describe Certificate_Application;
#6
insert into Certificate_Application(application_id, citizen_id, application_date,purpose,application_status,fee_paid,reference_number,certificate_id,office_id) values (2002, 999, '2026-08-03', 'Test','Pending', 30, 'GP20269999',1, 1);
insert into Certificate_Application(application_id, citizen_id, application_date,purpose,application_status,fee_paid,reference_number,certificate_id,office_id) values (2001, 101, '2026-08-03', 'Test','Pending', 30, 'GP2026999',999, 1);
delete from Citizen where (citizen_id=101);
delete from Certificate_Type where (certificate_type_id=1);
#PART C
#level-0
select *from Citizen;
select *from Certificate_Application;
select full_name from Citizen order by full_name asc;
select distinct village_name from Citizen;
select distinct certificate_name from Certificate_Type;
select distinct ct.certificate_name from Certificate_Type ct join Certificate_Application ca on ct.certificate_type_id=ca.certificate_id;
select distinct office_name from Panchayat_office;
select *from Certificate_application where (application_status='Pending');
select *from Citizen where village_name='Ramapuram';
select *from Certificate_Application where year(application_date)=2026;
select *from Certificate_Application order by application_date desc;
select *from Certificate_Application ca join Panchayat_office po on  ca.office_id=po.office_id where po.office_name='Nuzvid Panchayat office';
select c.full_name from Citizen c join Certificate_Application ca on c.citizen_id=ca.citizen_id join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate';
#level-1
select c.full_name from Citizen c join Certificate_Application ca on c.citizen_id=ca.citizen_id join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate' union select c.full_name from Citizen c join Certificate_Application ca on c.citizen_id=ca.citizen_id join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Residence Certificate';
select *from Certificate_Application where month(application_date)=1 union select *from Certificate_Application where month(application_date)=2;
select *from Citizen where village_name='Ramapuram' union select *from Citizen where village_name='Lakshmipuram';
select c.full_name from Citizen c join Certificate_Application ca on c.citizen_id=ca.citizen_id join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate' and c.citizen_id in  (select ca2.citizen_id from Certificate_Application ca2 join Certificate_Type ct2 on ca2.certificate_id=ct2.certificate_type_id where ct2.certificate_name='Residence Certifictae');
select distinct citizen_id from Certificate_Application where year(application_date)=2025 and citizen_id in( select citizen_id from Certificate_Application where year(application_date)=2026);
select c.full_name from Citizen c join Certificate_Application ca on c.citizen_id=ca.citizen_id join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certifiacte'and c.citizen_id not in (select ca2.citizen_id from Certificate_Application ca2 join Certificate_Type ct2 on ca2.certificate_id=ct2.certificate_type_id where ct2.certificate_name='Residence Certificate');
select distinct citizen_id from Certificate_application where year(application_date)=2026 and citizen_id not in( select citizen_id from Certificate_Application where year(application_date)=2025); 
insert into Certificate_Application(application_id, citizen_id, application_date, purpose, application_status, fee_paid, reference_number, issued_date, certificate_id, office_id) values (3001,999,'2026-08-04','testing','submitted',30.00,'GP20263001',null,1,1);
delete from Citizen where citizen_id=101;
#level-2
select full_name from Citizen where citizen_id in( select citizen_id from Certificate_application);
select full_name from Citizen where village_name in ( select po.village_name from Certificate_Application ca join Panchayat_office po on ca.office_id=po.office_id join certificate_type ct on ca.certificate_id=ct.certificate_type_id where ct.certificate_name='Income Certificate');
select full_name from Citizen where citizen_id not in ( select citizen_id from Certificate_Application);
select office_name from Panchayat_office where office_id not in (select distinct office_id from Certificate_Application);
select full_name from Citizen c where exists ( select *from Certificate_Application ca where ca.citizen_id=c.citizen_id);
select certificate_name from Certificate_Type ct where exists (select *from Certificate_Application ca where ca.certificate_id=ct.certificate_type_id);
select full_name from Citizen c where not exists (select *from Certificate_Application ca where ca.citizen_id=c.citizen_id);
select certificate_name from Certificate_Type ct where not exists ( select *from Certificate_Application ca where ca.certificate_id=ct.certificate_type_id);
select full_name from  Citizen where timestampdiff(year,date_of_birth,curdate()) > any (select timestampdiff(year , date_of_birth,curdate()) from Citizen where village_name='Ramapuram'); 
select ca.application_id ,ct.processing_days from Certificate_Application ca join Certificate_Type ct on ca.certificate_id=ct.certificate_type_id where ct.processing_days>any(select ct2.processing_days from Certificate_Application ca2 join Certificate_Type ct2 on ca2.certificate_id=ct2.certificate_type_id join Panchayat_office po on ca2.office_id=po.office_id where po.office_name='Nuzvid Panchayat Office');
#mini_challenge







