PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    f_name TEXT NOT NULL,
    l_name TEXT NOT NULL,
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NOT,

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    reply_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES user(id)   
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES user(id)
);

INSERT INTO
    users (f_name, l_name)
VALUES
    ('Aurthur', 'Miller')
    ('John', 'Smith')
    ('Jon', 'Doe');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Aurthur''s question', 'Help me!', 1)
    ('John''s question', 'Feed me!', 2)
    ('Jon''s question', 'Help me! Feed me! Save me!', 3);