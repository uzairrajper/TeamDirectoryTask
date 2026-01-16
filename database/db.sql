CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Use AUTOINCREMENT for SQLite/MySQL, works on most
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL
);

INSERT INTO employees (firstName, lastName, role) VALUES
('John', 'Doe', 'Frontend Developer'),
('Jane', 'Smith', 'Backend Developer'),
('Ali', 'Khan', 'QA Engineer'),
('Sara', 'Ahmed', 'UI Designer'),
('Mike', 'Brown', 'Project Manager');
