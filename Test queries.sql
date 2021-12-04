--a
select * from students where name = 'John';
--b
select * from students where surname like '%Sm%';
--c
select * from students where phone like '90351%';
--d
select * from students s inner join exam_results er on s.id = er.student_id where surname like '%Sm%';
