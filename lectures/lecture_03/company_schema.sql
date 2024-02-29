CREATE DATABASE IF NOT EXISTS company;

USE company;

SET SESSION foreign_key_checks=OFF;

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    fname    varchar(15) not null, 
    minit    varchar(1),
    lname    varchar(15) not null,
    ssn      char(9),
    bdate    date,
    address  varchar(50),
    sex      char,
    salary   decimal(10,2),
    superssn char(9),
    dno      decimal(4),
    primary key (ssn),
    foreign key (superssn) references employee(ssn)
--  foreign key (dno) references department(dnumber)
);

DROP TABLE IF EXISTS department;

CREATE TABLE department (
    dname        varchar(25) not null,
    dnumber      decimal(4),
    mgrssn       char(9) not null, 
    mgrstartdate date,
    primary key (dnumber),
    unique (dname),
    foreign key (mgrssn) references employee(ssn)
);

ALTER TABLE employee ADD (
    foreign key (dno) references department(dnumber)
);

DROP TABLE IF EXISTS dept_locations;

CREATE TABLE dept_locations (
    dnumber   decimal(4),
    dlocation varchar(15), 
    primary key (dnumber,dlocation),
    foreign key (dnumber) references department(dnumber)
);

DROP TABLE IF EXISTS project;

CREATE TABLE project (
    pname      varchar(25) not null,
    pnumber    decimal(4),
    plocation  varchar(15),
    dnum       decimal(4) not null,
    primary key (pnumber),
    unique (pname),
    foreign key (dnum) references department(dnumber)
);

DROP TABLE IF EXISTS works_on;

CREATE TABLE works_on (
    essn   char(9),
    pno    decimal(4),
    hours  decimal(4,1),
    primary key (essn,pno),
    foreign key (essn) references employee(ssn),
    foreign key (pno) references project(pnumber)
);

DROP TABLE IF EXISTS dependent;

CREATE TABLE dependent (
    essn           char(9),
    dependent_name varchar(15),
    sex            char,
    bdate          date,
    relationship   varchar(8),
    primary key (essn,dependent_name),
    foreign key (essn) references employee(ssn)
);
