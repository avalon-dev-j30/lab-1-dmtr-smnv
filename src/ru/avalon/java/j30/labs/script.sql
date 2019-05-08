# объявление таблицы Orders
CREATE table Orders (
id int(10) generated always as identity (start with 1, increment by 1) not null primary key,
users int(10) references Users(id),
created timestamp
);

# объявление таблицы Orders2Product
CREATE table Orders2Product (
orders int(10) not null primary key references Orders(id),
product int(10) not null primary key references Product(id)
);

# объявление таблицы Product
CREATE table Product (
id int(10) generated always as identity (start with 1, increment by 1) unique,
code varchar(255) not null primary key,
title varchar(255),
supplier int(10) references Supplier(id),
initial_price double(10),
retail_price double(10)
);

# объявление таблицы Supplier
CREATE table Supplier (
id int(10) generated always as identity (start with 1, increment by 1) unique,
name varchar(255) not null primary key,
address varchar(255) not null,
phone varchar(255),
representative varchar(255) not null
);

# объявление таблицы Users
CREATE table Users (
id int(10) generated always as identity (start with 1, increment by 1) unique,
email varchar(255) not null primary key,
password varchar(255),
info int(10) unique references UsersInfo(id),
role int(10) references Roles(id)
);

# объявление таблицы UsersInfo
CREATE table UsersInfo (
id int(10) generated always as identity (start with 1, increment by 1) not null primary key,
name varchar(255) not null,
surname varchar(255) not null
);

# объявление таблицы Roles
CREATE table Roles (
id int(10) generated always as identity (start with 1, increment by 1) unique,
name varchar(255) not null primary key
);



# инициализация полей таблицы Orders
INSERT into Orders (created)
values ('1970-01-01 00:00:00'),
          ('1994-09-04 06:00:00'),
          ('2019-05-08 12:00:00');

# инициализация полей таблицы Orders2Product
# ...

# инициализация полей таблицы Product
INSERT into Product (code, title, initial_price, retail_price)
values ('#FFFFFF', 'milk', 10.0, 15.0),
          ('#A0522D', 'potato', 5.0, 10.0),
          ('#FFFF00', 'banana', 15.0, 20.0);

# инициализация полей таблицы Supplier
INSERT into Supplier (name, address, phone, representative)
values ('X5 Retail Group', 'Moscow, Russia', '+7-800-000-00-00', 'John Doe'),
          ('Magnit', 'Krasnodar, Russia', '+7-800-000-00-00', 'Jane Doe'),
          ('Auchan', 'Croix, France', '+33-800-000-00-00', 'Mr. Nobody');

# инициализация полей таблицы Users
INSERT into Users (email, password)
values ('john@gmail.com', 'password'),
          ('ivan@mail.ru', '111111'),
          ('username@yandex.ru', 'pass111');

# инициализация полей таблицы UsersInfo
INSERT into UsersInfo (name, surname)
values ('Jonh', 'Doe'),
          ('Jane', 'Doe'),
          ('Guy', 'Fawkes');

# инициализация полей таблицы Roles
INSERT into Roles (name)
values ('Guest'),
          ('User'),
          ('Admin');