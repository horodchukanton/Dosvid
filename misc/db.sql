CREATE TABLE users
(
  id         INT(11) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  username   VARCHAR(32)                  NOT NULL,
  password   VARCHAR(40)                  NOT NULL,
  salt       VARCHAR(32)                  NOT NULL,
  email      VARCHAR(128)                 NOT NULL DEFAULT '',
  birthdate  DATE                         NOT NULL,
  photo      MEDIUMBLOB,
  is_student BOOLEAN                      NOT NULL DEFAULT 0,
  is_teacher BOOLEAN                      NOT NULL DEFAULT 0,
  account    DOUBLE PRECISION             NOT NULL DEFAULT 0
);

CREATE UNIQUE INDEX username
  ON users (username);

CREATE TABLE roles
(
  id   INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  role VARCHAR(32)         NOT NULL
);

CREATE TABLE user_roles
(
  user_id INT(11) REFERENCES users (`id`)
    ON DELETE CASCADE,
  role_id INT(11) REFERENCES roles (`id`)
    ON DELETE CASCADE

);
CREATE UNIQUE INDEX user_role
  ON user_roles (user_id, role_id);

CREATE TABLE user_sessions (
  id  INT(11) UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
  uid INT(11) PRIMARY KEY                    NOT NULL REFERENCES users (`id`)
    ON DELETE CASCADE,
  ua  VARCHAR(100)                           NOT NULL DEFAULT ''
);
CREATE INDEX user_sessions_
  ON user_sessions (uid);

CREATE TABLE messages (
  id       INT(11) UNSIGNED PRIMARY KEY NOT NULL,
  created  TIMESTAMP                              DEFAULT CURRENT_TIMESTAMP,
  is_read  TINYINT(1)                   NOT NULL  DEFAULT 0,
  readed   TIMESTAMP                              DEFAULT CURRENT_TIMESTAMP,
  sender   INT(11) UNSIGNED REFERENCES users (`id`)
    ON DELETE CASCADE,
  receiver INT(11) UNSIGNED REFERENCES users (`id`)
    ON DELETE CASCADE,
  header   VARCHAR(120)                 NOT NULL  DEFAULT '',
  message  TEXT                         NOT NULL
);

CREATE TABLE sciences (
  id          INT(11) UNSIGNED PRIMARY KEY NOT NULL,
  name        VARCHAR(32)                  NOT NULL,
  description TEXT
);

CREATE TABLE science_chapters (
  id          INT(11) UNSIGNED PRIMARY KEY NOT NULL,
  science_id  INT(11) UNSIGNED REFERENCES sciences (`id`)
    ON DELETE CASCADE,
  name        VARCHAR(64)                  NOT NULL,
  description TEXT
);

CREATE TABLE teachers (
  uid         INT(11) UNSIGNED REFERENCES users (`id`)
    ON DELETE CASCADE,
  level       SMALLINT(6),
  is_verified TINYINT(1) NOT NULL DEFAULT 0,
  documents   MEDIUMBLOB
);

CREATE TABLE teacher_certificates (
  id                 INT(11) UNSIGNED PRIMARY KEY,
  science_chapter_id INT(11) UNSIGNED REFERENCES science_chapters (`id`)
    ON DELETE RESTRICT,
  uid                INT(11) UNSIGNED REFERENCES users (`id`)
    ON DELETE CASCADE,
  name               VARCHAR(60) NOT NULL,
  weight             SMALLINT(6) NOT NULL DEFAULT 0,
  created            TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  achieved           TIMESTAMP   NOT NULL,
  document           MEDIUMBLOB
);

CREATE TABLE users_science_chapters (
  uid                INT(11) UNSIGNED REFERENCES users (`id`)
    ON DELETE CASCADE,
  science_chapter_id INT(11) UNSIGNED REFERENCES science_chapters (`id`)
    ON DELETE CASCADE,
  level              SMALLINT(6) NOT NULL DEFAULT 0
);

CREATE TABLE chats (
  id      INT(11) UNSIGNED PRIMARY KEY,
  started TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  owner   INT(11) UNSIGNED REFERENCES users (`id`)
);

CREATE TABLE chats_users (
  chat_id INT(11) UNSIGNED REFERENCES chats (`id`),
  uid     INT(11) UNSIGNED REFERENCES users (`id`),
  joined  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE chat_messages (
  chat_id INT(11) UNSIGNED REFERENCES chats (`id`),
  uid     INT(11) UNSIGNED REFERENCES users (`id`),
  text    TEXT NOT NULL,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
