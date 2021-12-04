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
