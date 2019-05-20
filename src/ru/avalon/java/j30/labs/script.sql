CREATE table UsersInfo (
id int generated always as identity (start with 1, increment by 1) not null primary key,
name varchar(255) not null,
surname varchar(255) not null);
INSERT into UsersInfo (name, surname)
values  ('Jonh', 'Doe'),
        ('Jane', 'Doe'),
        ('Guy', 'Fawkes');

CREATE table Supplier (
id int generated always as identity (start with 1, increment by 1) unique,
name varchar(255) not null primary key,
address varchar(255) not null,
phone varchar(255),
representative varchar(255) not null);
INSERT into Supplier (name, address, phone, representative)
values  ('X5 Retail Group', 'Moscow, Russia', '+7-800-000-00-00', 'John Doe'),
        ('Magnit', 'Krasnodar, Russia', '+7-800-000-00-00', 'Jane Doe'),
        ('Auchan', 'Croix, France', '+33-800-000-00-00', 'Mr. Nobody');

CREATE table Roles (
id int generated always as identity (start with 1, increment by 1) unique,
name varchar(255) not null primary key);
INSERT into Roles (name)
values  ('Guest'),
        ('User'),
        ('Admin');

CREATE table Users (
id int generated always as identity (start with 1, increment by 1) unique,
email varchar(255) not null primary key,
password varchar(255),
info int unique references UsersInfo(id),
role int references Roles(id));
INSERT into Users (email, password)
values  ('john@gmail.com', 'password'),
        ('ivan@mail.ru', '111111'),
        ('username@yandex.ru', 'pass111');

CREATE table Orders (
id int generated always as identity (start with 1, increment by 1) not null primary key,
users int references Users(id),
created timestamp);
INSERT into Orders (created)
values  ('1970-01-01 00:00:00'),
        ('1994-09-04 06:00:00'),
        ('2019-05-08 12:00:00');

CREATE table Product (
id int generated always as identity (start with 1, increment by 1) unique,
code varchar(255) not null primary key,
title varchar(255),
supplier int references Supplier(id),
initial_price double,
retail_price double);
INSERT into Product (code, title, initial_price, retail_price)
values  ('#FFFFFF', 'milk', 10.0, 15.0),
        ('#A0522D', 'potato', 5.0, 10.0),
        ('#FFFF00', 'banana', 15.0, 20.0);

CREATE table Orders2Product (
orders int not null references Orders(id),
product int not null references Product(id),
constraint pk_Orders2Product primary key (orders, product));