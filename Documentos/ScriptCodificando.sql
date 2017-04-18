drop database if exists codificando;
create database if not exists codificando;
use codificando;
create table if not exists adm(
	id integer auto_increment not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) not null unique,
    born date not null,
    `password` varchar(15) not null,
	description varchar(400) not null
);
create table if not exists article(
	id integer auto_increment not null primary key,
    title varchar(50) not null,
    description varchar(400) not null,
    number_image int not null,
    date_create date not null, 
    id_adm integer not null,
    constraint article_adm 
    foreign key (id_adm) 
    references adm(id) 
    on delete cascade
    on update cascade
);
create table if not exists section(
	id integer auto_increment not null primary key,
    title varchar(50) not null,
    content varchar(60000) not null,
    id_article integer not null,
    constraint secao_article 
    foreign key (id_article) 
    references article(id)
    on delete cascade
    on update cascade
);
