explain analyse INSERT INTO students (name, surname, date_of_birth, phone, primary_skill)
SELECT
        substr(md5(random()::text), 1, 10),
        substr(md5(random()::text), 1, 10),
        (DATE '2010-01-01' - (random() * 10000)::integer),
        (random()*999999999)::integer,
        substr(md5(random()::text), 1, 5)
FROM generate_series(1, 100000);

explain analyse INSERT INTO subjects (subject_name, tutor)
SELECT
        substr(md5(random()::text), 1, 10),
        substr(md5(random()::text), 1, 10)
FROM generate_series(1, 1000);

explain analyse INSERT INTO exam_results (student_id, subject_id, mark)
SELECT
        (random()*100000)::integer,
        (random()*1000)::integer,
        (random()*100)::integer
FROM generate_series(1, 1000000);