PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    f_name TEXT NOT NULL,
    l_name TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    reply_id INTEGER,
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    users (f_name, l_name)
VALUES
    ('Aurthur', 'Miller'),
    ('John', 'Smith'),
    ('Jon', 'Doe');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Aurthur''s question', 'Help me!', 1),
    ('John''s question', 'Feed me!', 2),
    ('Jon''s question', 'Help me! Feed me! Save me!', 3);

INSERT INTO
    question_follows(users_id, questions_id)
VALUES
    (1,1),
    (2,2),
    (3,3);
    -- ((SELECT id FROM users WHERE f_name = 'Aurthur'),(SELECT id FROM questions WHERE users_id = 1)),
    -- ((SELECT id FROM users WHERE f_name = 'John'),(SELECT id FROM questions WHERE users_id = 2)),
    -- ((SELECT id FROM users WHERE f_name = 'Jon'),(SELECT id FROM questions WHERE users_id = 3));

INSERT INTO
    replies(questions_id, reply_id, users_id, body)
VALUES 
    (1, NULL, 1, 'Sorry, I can''t help'),
    (2, NULL, 2, 'Sorry, I have no food'),
    (3, NULL, 3, 'Sorry');

INSERT INTO
    question_likes(users_id, questions_id)
VALUES  
    (1,1),
    (1,2),
    (2,3),
    (3,1);