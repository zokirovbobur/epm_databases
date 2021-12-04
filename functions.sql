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