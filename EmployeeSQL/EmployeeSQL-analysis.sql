select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
inner join salaries s
on e.emp_no = s.emp_no;

select e.first_name,e.last_name,e.hire_date
from employees e
where extract(year from hire_date) = 1986;

select d.dept_name,dm.dept_no,dm.emp_no,e.first_name,e.last_name
from employees e
inner join dept_manager dm
on e.emp_no = dm.emp_no
inner join departments d
on d.dept_no = dm.dept_no;

select de.dept_no,d.dept_name,e.emp_no,e.first_name,e.last_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on d.dept_no = de.dept_no
order by e.emp_no;

select e.first_name,e.last_name,e.sex
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%';

select e.emp_no,e.first_name,e.last_name
from employees e
where emp_no in
(	select emp_no 
	from dept_emp
	where dept_no in
	(   select dept_no
		from departments
		where dept_name = 'Sales'))
order by e.emp_no;

select e.emp_no,e.first_name,e.last_name,d.dept_name
from employees e
inner join dept_emp
on e.emp_no=dept_emp.emp_no
inner join departments d
on d.dept_no = dept_emp.dept_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development'
order by e.emp_no;

select last_name, count(last_name) as "Surname Count"
from employees
group by last_name
order by "Surname Count" desc;