create database if not exists joins;

use joins;

set session foreign_key_checks=OFF;

drop table if exists sites;
create table sites (
    site_id int primary key, 
    site_name varchar(100)
);

drop table if exists pages;
create table pages (
    page_id int primary key, 
    site_id int, 
    page_title varchar(100),
    foreign key (site_id) 
        references sites(site_id) 
            on delete cascade on update cascade
);

insert into sites 
values
    (1000,'TechOnTheNet.com'),
    (2000,'CheckYourMath.com'),
    (3000,'BigActivities.com'),
    (4000,'Google.com');

insert into pages(page_id, site_id,page_title) 
values
    (1,1000,'MariaDB'),
    (2,1000,'Oracle'),
    (3,2000,'Convert cm to inches'),
    (4,3000,'Coloring pages'),
    (5,5000,'Great stuff');