-- show databases; 
-- use mysql;
-- show tables ;
-- select * from db;
-- select * from func;
-- create table one (
-- id int unsigned NOT NULL auto_increment,
--  username varchar(100) NOT NULL,
--  email varchar(100) NOT NULL,
--  PRIMARY KEY (id));
 select * from one ;
--  insert into one values(null, "myuser", "myuser@example.com" );
--  update one set username = "sajhsjah" where username = "myuser";
--  show tables;
--  use one;
-- create table tab 
--  select * from mysql.one;
-- select * from one;
-- create user 'user'@'localhost' identified by '';
-- create table two (
-- `date` char(10) 
-- );
-- create temporary table thr 
-- select * from one ;
-- show tables ;
-- select 'snsa123' * 1212;
-- select '123saan' * 1212;
-- select @one := '213';
-- set @two = '2020-12-31';
-- select extract(year YEAR_MONTH from @two );
-- create table exa (
-- id bigint not null primary key auto_increment,
-- name varchar(20) not null ,
-- age bigint check(age>18));
-- insert into exa values (1, "sash",20),
-- (2, "sjajs",21);
-- select @rn := if(@prev = a.name,@rn+1 ,1) as row_num , @prev = a.name ,age from exa a ;
#kewlk

create table people
( id int primary key,
 name varchar(100) not null,
 gender char(1) not null
);
insert people (id,name,gender) values
(1,'Kathy','f'),(2,'John','m'),(3,'Paul','m'),(4,'Kim','f');
create table pets
( id int auto_increment primary key,
 ownerId int not null,
 name varchar(100) not null,
 color varchar(100) not null
);
insert pets(ownerId,name,color) values
(1,'Rover','beige'),(2,'Bubbles','purple'),(3,'Spot','black and white'),
(1,'Rover2','white');

-- delete b  from people a join pets b 
-- on a.id= b.id where b.name = "spot";
-- select * from pets,people;
-- people a join pets b on a.id = b.id where b.name = "Rover2";
-- select * from people;

-- alter table pets add constraint "one" foreign key (ownerid) references  people(id) on delete cascade;
-- DELETE FROM people
-- WHERE name = 'Paul';

-- set foreign_key_checks = 0 ;
-- DELETE p1, p2 FROM people p1 JOIN pets p2 ON p2.ownerId = p1.id WHERE p1.name = 'Paul';
-- set foreign_key_checks = 1;
-- delete from people limit 0 ;
-- update people a join pets b 
-- on a.id = b.id  set a.name = "aditi" where a.name = "john";
-- select * from people;
-- update people set name = (case name when "kathy" then "aditi"
-- when "aditi" then "kathy"
-- end);

select * from people;
alter table people
add column last int ;
-- insert into people values (3,"sjajs",null,null);
-- -- alter table people 
-- -- modify gender varchar(50) null;

-- select * from people order by gender is null;

select * from people order by find_in_set(gender ,"m,f,null") ;  
 /*
 3	sjajs		
2	kathy	m	
1	aditi	f	
			*/
select * from people order by find_in_set(gender ,"m,f,null") is null ;

/*
1	aditi   	f
2	kathy	m
3	sjajs     null 
*/
-- select * from people ;

-- DROP TABLE IF EXISTS `owners`;
-- CREATE TABLE `owners` (
-- `owner_id` int(11) NOT NULL AUTO_INCREMENT,
-- `owner` varchar(30) DEFAULT NULL,
-- PRIMARY KEY (`owner_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- INSERT INTO `owners` VALUES ('1', 'Ben');
-- INSERT INTO `owners` VALUES ('2', 'Jim');
-- INSERT INTO `owners` VALUES ('3', 'Harry');
-- INSERT INTO `owners` VALUES ('6', 'John');
-- INSERT INTO `owners` VALUES ('9', 'Ellie');

-- DROP TABLE IF EXISTS `tools`;
-- CREATE TABLE `tools` (
-- `tool_id` int(11) NOT NULL AUTO_INCREMENT,
-- `tool` varchar(30) DEFAULT NULL,
-- `owner_id` int(11) DEFAULT NULL,
-- PRIMARY KEY (`tool_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- INSERT INTO `tools` VALUES ('1', 'Hammer', '9');
-- INSERT INTO `tools` VALUES ('2', 'Pliers', '1');
-- INSERT INTO `tools` VALUES ('3', 'Knife', '1');
-- INSERT INTO `tools` VALUES ('4', 'Chisel', '2');
-- INSERT INTO `tools` VALUES ('5', 'Hacksaw', '1');
-- INSERT INTO `tools` VALUES ('6', 'Level', null);
-- INSERT INTO `tools` VALUES ('7', 'Wrench', null);
-- INSERT INTO `tools` VALUES ('8', 'Tape Measure', '9');
-- INSERT INTO `tools` VALUES ('9', 'Screwdriver', null);
-- INSERT INTO `tools` VALUES ('10', 'Clamp', null);

-- select * from owners ;
-- select * from tools;

-- -- select a.owner , b.tool , count(a.owner) as c from owners a  join tools b on a.owner_id = b.owner_id  group by a.owner , b.tool order by a.owner;
-- -- select a.owner , b.tool from owners a  join tools b on a.owner_id != b.owner_id ;

-- CREATE TABLE `user` (
-- `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
-- `name` varchar(30) NOT NULL,
-- `course` smallint(5) unsigned DEFAULT NULL,
-- PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB;
-- CREATE TABLE `course` (
-- `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
-- `name` varchar(50) NOT NULL,
-- PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB;

-- alter table user add constraint  sas foreign key (course) references  course(id) on update cascade;


-- CREATE TABLE Table1 (
--  id INT UNSIGNED NOT NULL,
--  created_on DATE NOT NULL,
--  PRIMARY KEY (id)
-- );
-- CREATE TABLE Table2 (
--  id INT UNSIGNED NOT NULL,
--  personName VARCHAR(255) NOT NULL,
--  PRIMARY KEY (id)
-- );
-- CREATE TABLE Table3 (
--  id INT UNSIGNED NOT NULL,
--  accountName VARCHAR(255) NOT NULL,
--  PRIMARY KEY (id)
-- );

-- create view sample1 as select  t1. created_on, t2.personname , t3.accountname from table1 t1 inner join table2 t2 on t2.id = t1.id inner join table3 t3 on t3.id = t1.id ;
-- select * from sample;

-- SELECT
--  t1.id AS table1Id,
--  t2.id AS table2Id,
--  t3.id AS table3Id
-- FROM Table1 t1
-- LEFT JOIN Table2 t2 ON t2.id = t1.id
-- LEFT JOIN Table3 t3 ON t3.id = t1.id;

-- select * from owners  
-- union all 
-- select owner_id , tool from tools order by owner_id;

-- select * from owners  
-- union all 
-- select owner_id , tool from tools order by owner_id;

set @oa = pi();
-- select substring("sasjjas",2,2);
-- select upper("sasan");
-- select lower("SASJAj");

-- set @name = "saksja";
-- select concat(ucase(substring(@name,1,1)),lower(substring(@name,2)));

select replace("mnmsnnsd","msn","dsdhsh");
select find_in_set("ss","sa,sa,ss,a");
select now() + interval 1 day;

select sysdate();
select * from owners;
select * from owners where owner like  "j%";
select * from owners where owner regexp  "^b";
-- select * from owners where owner like  "b%" and owner  like "%n";
-- select * from owners where owner regexp "^[bj]";
-- select * from owners where owner like "[bj]%";  # wont work 

CREATE TABLE Person (
 PersonID INT UNSIGNED NOT NULL ,
 LastName VARCHAR(66) NOT NULL,
 FirstName VARCHAR(66),
 Address VARCHAR(255),
 City VARCHAR(66),
 PRIMARY KEY( PersonID, LastName)
)engine = InnoDB;
desc person;
desc owners;
alter table person 
add constraint two foreign key (lastname) references owner(owner) on delete cascade;
-- show foreign keys ;

### Alter Command 

Create table stack(
 id_user int NOT NULL,
 username varchar(30) NOT NULL,
 password varchar(30) NOT NULL
);
-- alter table stack 
-- add column one int not null;
select * from stack;
-- alter table stack 
-- drop column one ;
alter table stack 
add column `date` datetime ;



alter table stack 
modify column `date` datetime not null default current_timestamp on update current_timestamp;

desc stack;

alter table stack 
add index one(username);
-- show indexes;
show databases;
start transaction ;
select owner from owners for update ;

update owners 
set owner = "aditicuddly" where owner = "aditi";

show open tables ;
lock table owners read;
unlock tables ;


