--5
create function update_time() returns trigger language plpgsql
as $$
    begin
        NEW.updated_datetime = now();
        return NEW;
    end;
    $$;

create trigger update_time_trigger
    before update on students for each row
    execute procedure update_time();

--6
create function user_name_validation() returns trigger language plpgsql
as $$
    begin
        if NEW.name like '%@%' or NEW.name like '%#%' or NEW.name like '%$%' then
            return null;
        end if;
        return NEW;
    end;
    $$;

create trigger user_name_validation_trigger
    before insert on students for each row
    execute procedure user_name_validation();

--7
--createdb -O postgres -T postgres postgres_clone

--8
create function avg_mark_by_student(student_id_arg int) returns numeric language plpgsql
as $$
    begin
        return (select sum(er.mark)/ count(er.id) as avg_mark from students s inner join exam_results er on s.id = er.student_id where s.id = student_id_arg);
    end;
    $$;

select avg_mark_by_student(1);

--9
create function avg_mark_by_subject(subject_id_arg int) returns numeric language plpgsql
as $$
    begin
        return (select sum(er.mark)/ count(er.id) as avg_mark from subjects s inner join exam_results er on s.id = er.subject_id where s.id = subject_id_arg);
    end;
    $$;

select avg_mark_by_subject(149);
