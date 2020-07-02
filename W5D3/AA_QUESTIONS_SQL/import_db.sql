PRAGMA foreign_keys = ON;

CREATE TABLE questions( 
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_like(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
 
INSERT INTO 
    users(fname, lname)
VALUES
    ('Ned', 'Haha'),
    ('Kush', 'TheFuck'),
    ('Thomas', 'Genius');

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('Ned Question', 'NED NED NED', (SELECT id from users WHERE fname = 'Ned')),
    ('Kush Question', 'Kush Kush Kush', (SELECT id from users WHERE fname = 'Kush')),
    ('Thomas Question', 'Thomas Thomas Thomas', (SELECT id from users WHERE fname = 'Thomas'));



INSERT INTO replies
(
 question_id, parent_reply_id, user_id, body
)
VALUES
   (1, NULL, 2, '1-What the fuck?man'),
   (1, 1, 1, '2-No worries. xixi'),
   (1, 1, 3, '2-He is a retar'),
   (1, 3, 3, '3-We are family'),
   (2, NULL, 2, '1-What the fuck?man');


INSERT INTO question_like
    (
    user_id, question_id
    )
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3);



INSERT INTO 
    question_follows(user_id, question_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3);





