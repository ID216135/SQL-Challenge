drop table if exists salaries;
drop table if exists dept_manager;
drop table if exists dept_emp;
drop table if exists employees;
drop table if exists departments;
drop table if exists titles;

create table departments (
	dept_no varchar(4) primary key not null,
	dept_name varchar(30) not null
	);


create table titles (
	title_id varchar(5) not null primary key,
	title varchar(30) not null
	);


create table employees (
	emp_no integer not null primary key,
	emp_title_id varchar(5) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id));


create table salaries(
	emp_no integer not null primary key,
	salary integer not null,
	foreign key (emp_no) references employees(emp_no));


create table dept_emp (
	emp_no integer not null,
	dept_no varchar(4) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no));


create table dept_manager (
	dept_no varchar(4) not null,
	emp_no integer not null,
	primary key (emp_no, dept_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no));

