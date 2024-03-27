drop database if exists gallery;

create database gallery;

use gallery;

create table goods(
	good_no int auto_increment primary key,
    name varchar(100) not null,
    price decimal null default null,
    size varchar(100) null default null,
    type enum('1', '2', '3') not null,
    year year null default null,
    artist_id int
);

create table people(
	id int auto_increment primary key,
    name varchar(100) not null,
    address varchar(100),
    phone varchar(10) not null unique,
    is_artist boolean default 0
);

create table services(
	id int auto_increment primary key,
    final_price decimal not null default 0,
    type enum('1', '2', '3') not null,
    date_created datetime null default null,
    end_date datetime null default null,
    comment text null default null,
    size varchar(100) null default null,
    employee_name varchar(100) not null,
    is_ready boolean default 0,
    is_received boolean default 0,
    good_id int,
    customer_id int,
    artist_id int
);

alter table goods 
add constraint 
foreign key (artist_id) 
	references people(id)
    on update cascade
    on delete cascade;
    
alter table services
add constraint
foreign key (good_id)
	references goods(good_no)
    on update cascade
    on delete cascade,
add constraint
foreign key (customer_id)
	references people(id)
    on update cascade
    on delete cascade,
add constraint 
foreign key (artist_id)
	references people(id)
    on update cascade
    on delete cascade;