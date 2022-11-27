create database carbscounter;
use carbscounter;

create table if not exists usuarios(
id int not null auto_increment primary key,
cpf varchar(11) not null unique,
nome varchar(255) not null,
nascimento date not null,
peso decimal(5,2) not null,
altura decimal(3,2) not null,
email varchar(255) not null,
senha varchar(255) not null,
tipo_diabetes enum('Diabetes Mellitus tipo 1','Diabetes Mellitus tipo 2','Diabetes Mellitus tipo Gestacional','Diabetes tipo LADA','Diabetes tipo MODY') not null
) default charset utf8mb4;

create table if not exists alimentos(
id int not null auto_increment primary key,
porcao_alimento smallint not null,
nome_alimento varchar(255) not null,
quantidade_calorias decimal(5,2) not null,
quantidade_carboidratos decimal(5,2) not null,
quantidade_proteinas decimal(5,2) not null,
quantidade_gorduras decimal(5,2) not null,
medida enum('Colher de sopa cheia','Unidade','Fatia média','File Médio','Copo');
) default charset utf8mb4;

create table if not exists diarios(
id int not null auto_increment primary key,
id_usuario int not null,
data_preenchimento datetime
) default charset utf8mb4;

alter table diarios
add foreign key (id_usuario)
references usuarios(id);

create table if not exists alimentos_diario(
id int not null auto_increment primary key,
id_alimento int not null,
id_diario int not null,
quantidade_porcao decimal(5,2) not null
) default charset utf8mb4;

alter table alimentos_diario
add foreign key (id_alimento)
references alimentos(id),
add foreign key (id_diario)
references diarios (id);