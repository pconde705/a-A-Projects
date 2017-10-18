DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id  INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id)
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  author_id  INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,
  body_reply TEXT NOT NULL,
  parent_reply_id INTEGER,

  FOREIGN KEY(author_id) REFERENCES users(id)
  FOREIGN KEY(questions_id) REFERENCES questions(id)
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id  INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id)
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Hyuna', 'Kim'),
  ('Patrick', 'Conde-Costas'),
  ('Andrew', 'Cho');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('4Minute reunion?', 'When is the damn reunion? Her solo career was
    good but now it''s no good.', (SELECT id from users WHERE fname = 'Patrick')),
  ('5Minute reunion?', 'Screw 4Minute PATRICK, when is the damn 5MINUTE
    reunion?? I''ve been waiting so long', (SELECT id FROM users WHERE
    fname = 'Andrew')),
  ('Kara reunion?', 'We all know Kara > 4Minute, dance! HAving said
    that 2NE1 reunion anyone?', (SELECT id from users WHERE fname = 'Patrick'));

INSERT INTO
  replies (author_id, questions_id, body_reply, parent_reply_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Hyuna'), (SELECT id FROM questions
  WHERE title = '4Minute reunion?'), 'Screw you Patrick, I am so happy
  to never have a reunion ever again!', NULL),
  ((SELECT id FROM users WHERE fname = 'Patrick'), (SELECT id FROM questions
  WHERE title = '4Minute reunion?'), 'How about a quick concert with PSY
  then at least? Prety please!', 1);

INSERT INTO
  question_follows (user_id, questions_id)
VALUES
  (3, 1),
  (2, 2),
  (1, 2);

INSERT INTO
  question_likes (user_id, questions_id)
VALUES
  (3, 2),
  (2, 2),
  (1, 2),
  (3, 1),
  (1, 3),
  (2, 3),
  (3, 3);
