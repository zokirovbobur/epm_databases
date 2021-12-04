create table students (
    id serial primary key,
    name varchar(12),
    surname varchar(12),
    date_of_birth date,
    phone varchar(13),
    primary_skill varchar(12),
    created_datetime timestamp default now(),
    updated_datetime timestamp default now()
                      );

create table subjects (
    id serial primary key,
    subject_name varchar(12),
    tutor varchar(12)
    );

create table exam_results (
    id serial primary key,
    student_id int ,
    subject_id int,
    mark numeric(3),
constraint student_fk FOREIGN KEY (student_id) REFERENCES students(id),
constraint subject_fk FOREIGN KEY (subject_id) REFERENCES subjects(id)
                          );

create index date_of_birth_index on students (date_of_birth);