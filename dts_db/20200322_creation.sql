
# Criação do bando de dados

create database frota;

use frota;

# Criação das tabelas

create table cadastre (
    plate char(7) primary key,
    model varchar(50),
    car_type varchar(25),
    unity_code int,
    manufacture int,
    chassi varchar(25),
    renavam int,
    fuel varchar(20),
    venal_value float,
    patrimony varchar(25),
    car_use varchar(25),
    destination varchar(50),
    car_description varchar(500),
    origin varchar(30), #source report
    date_update datetime #date of the last update on the line
) engine = innodb;

create table unity (
    unity_code int primary key,
    unity varchar(100),
    abreviation varchar(60),
    initials varchar(10),
    city varchar(50),
    risp enum("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "socioeducativo", "administrativo"),
    unity_code_2019 int,
    fuel_unit varchar(100),
    origin varchar(25)
) engine = innodb;

create table fuel (
	agency enum( 'SEDS', 'SEAP', 'SESP'),
	sistem  enum('VALECARD', 'SGTA'),
	plate char(7),
	supply_date datetime, 
	fuel varchar(20),
	volume float,
	fuel_value float,
	fuel_pk varchar(70) primary key,
	unity_code int,
	unity varchar(100),
	initials char(70)
) engine = innodb;

create table maintenance (
os bigint,
main_type varchar(25),
plate char(7),
situation varchar(50),
duration float, #transform duration time of maintenance to hours in a float type.
city varchar(30),
workshop varchar(100),
approver varchar(50),
entry_date datetime,
left_date datetime,
budgeted float,
approved float,
piece float,
labor float,
unity_code int, #current unity code of the plate on the update
main_pk varchar(100) primary key #combination of os, plate and situation
) engine = innodb;

create table attendance (
attendance_number bigint primary key,
plate char(7),
duration float, #transform duration time of attendance to hours in a float type.
km float,
unity_code int,
left_date datetime,
left_odometer float,
return_date datetime,
return_odometer float,
attendance_type varchar(20),
cpf char(14)
) engine = innodb;

create table accident (
plate char(7),
unity_code int,
cpf varchar(14),
chassi varchar(25),
sei varchar(30),
bo varchar(18) primary key,
accident_date datetime,
send_date datetime,
note varchar(500)
) engine = innodb;

create table risp(
risp enum("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "socioeducativo", "secretaria"),
city varchar(50),
unity_code int
) engine = innodb;

create table driver (
cpf varchar(14) primary key,
driver_name varchar(50),
masp varchar(10)
) engine = innodb;

create table fine (
agency varchar(10),
plate char(7),
unity_code int,
chassi varchar(25),
ait varchar(20) primary key,
sei varchar(30),
category enum ("NP", "FICI", "NICI") ,
fine_code int,
fine_description varchar(100),
fine_date datetime,
fine_agency varchar(100),
cpf varchar(14),
note varchar(500)
) engine = innodb;

create table chassi (
plate char(7),
chassi varchar(25) primary key
) engine = innodb;

# Foreign Keys description

# Accident's foreign keys

alter table accident add constraint fk_accident_plate 
foreign key (plate) references cadastre(plate);

alter table accident add constraint fk_accident_unitycode 
foreign key (unity_code) references unity(unity_code);

alter table accident add constraint fk_accident_chassi 
foreign key (chassi) references chassi(chassi);

alter table accident add constraint fk_accident_cpf
foreign key (cpf) references driver(cpf);

# Attendance's foreign keys

alter table attendance add constraint fk_attendance_unitycode 
foreign key (unity_code) references unity(unity_code);

alter table attendance add constraint fk_attendance_plate 
foreign key (plate) references cadastre(plate);

# Cadastre's foreign keys

alter table cadastre add constraint fk_cadastre_unitycode 
foreign key (unity_code) references unity(unity_code);

alter table cadastre add constraint fk_cadastre_chassi 
foreign key (chassi) references chassi(chassi);

# Fine's foreign keys

alter table fine add constraint fk_fine_plate
foreign key (plate) references cadastre(plate);

alter table fine add constraint fk_fine_unitycode 
foreign key (unity_code) references unity(unity_code);

alter table fine add constraint fk_fine_chassi 
foreign key (chassi) references chassi(chassi);

alter table fine add constraint fk_fine_cpf
foreign key (cpf) references driver(cpf);

# Fuel's foreign keys

alter table fuel add constraint fk_fuel_plate
foreign key (plate) references cadastre(plate);

alter table fuel add constraint fk_fuel_unitycode 
foreign key (unity_code) references unity(unity_code);

# Maintenance's foreign keys

alter table maintenance add constraint fk_maintenance_plate
foreign key (plate) references cadastre(plate);

alter table maintenance add constraint fk_maintenance_unitycode 
foreign key (unity_code) references unity(unity_code);

# RISP's foreign keys

alter table risp add constraint fk_risp_unitycode 
foreign key (unity_code) references unity(unity_code);

