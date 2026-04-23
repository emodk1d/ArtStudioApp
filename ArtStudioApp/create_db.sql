CREATE TABLE table_performers
(
    id                INTEGER PRIMARY KEY AUTOINCREMENT,
    nickname          TEXT NOT NULL UNIQUE,
    registration_date TEXT NOT NULL
);

CREATE TABLE table_passport
(
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    series           INT  NOT NULL,
    number           INT  NOT NULL,
    issued_by        TEXT NOT NULL,
    issued_date      TEXT NOT NULL,
    departament_code INT  NOT NULL,
    UNIQUE (series, number)
);

CREATE TABLE table_personal_files
(
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    performer_id INTEGER NOT NULL UNIQUE,
    passport_id  INTEGER NOT NULL UNIQUE,
    first_name   TEXT    NOT NULL,
    last_name    TEXT    NOT NULL,
    second_name  TEXT    NULL,
    address      TEXT    NOT NULL,
    FOREIGN KEY (performer_id) REFERENCES table_performers (id),
    FOREIGN KEY (passport_id) REFERENCES table_passport (id)
);

CREATE TABLE table_projects
(
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    name     TEXT NOT NULL,
    deadline TEXT NOT NULL
);

CREATE TABLE project_participations
(
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    performer_id INTEGER NOT NULL,
    project_id   INTEGER NOT NULL,
    role         TEXT    NOT NULL,
    FOREIGN KEY (performer_id) REFERENCES table_performers (id),
    FOREIGN KEY (project_id) REFERENCES table_projects (id),
    UNIQUE (performer_id, project_id)
);