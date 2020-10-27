DROP DATABASE IF EXISTS team2;
CREATE DATABASE team2; 

USE team2;

DROP TABLE IF EXISTS user;
CREATE TABLE user(
    UserID INT AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    HashPass VARCHAR(200) NOT NULL,
    ContactInfo VARCHAR(200),
    InformationVis TINYINT,
    Email VARCHAR(100),
    UserType VARCHAR(100) NOT NULL,
    PRIMARY KEY (UserID)
);

INSERT INTO user (UserName, HashPass, ContactInfo, InformationVis, Email, UserType) VALUES
    ('MarkFontenot', '123123123123', 'slack', 1, 'mfonten@smu.edu', 'Manager'),
    ('KristinaCannon', '222222222222', 'slack', 0, 'kristinac@smu.edu', 'Manager'),
    ('JamesZhai', '33333333333333', '111-222-3333', 1, 'xzhai@smu.edu', 'Contractor'),
    ('WillDunn', '444444444444444', '222-333-4444', 0, 'rrogan@smu.edu', 'Vendor'),
    ('RaniRogan', '55555555555', '333-444-5555', 1, 'wjdunn@smu.edu', 'Contractor');


DROP TABLE IF EXISTS project;
CREATE TABLE project(
    ProjectID INT AUTO_INCREMENT,
    ProjectName VARCHAR(50) NOT NULL,
    ApplyDate DATE,
    ExpireDate DATE,
    ProjectStatus VARCHAR(100),
    ProjectType VARCHAR(100),
    ManagerID INT,
    PRIMARY KEY (ProjectID),
	FOREIGN KEY(ManagerID)
		REFERENCES user(UserID)
        ON UPDATE CASCADE
);

INSERT INTO project (ProjectName, ApplyDate, ExpireDate, ProjectStatus, ProjectType, ManagerID) VALUES
    ('F22-2020', '2020-10-27', '2020-11-03', 'Unfinished', 'AirPlane', 1),
    ('M1A2-2020', '2020-04-12', '2020-10-27', 'Finished', 'Tank', 2),
    ('F18-2020', '2020-01-01', '2020-09-03', 'Unfinished', 'AirPlane', 1),
    ('M16-2020', '2020-10-05', '2021-01-21', 'Unfinished', 'Rifle', 2),
    ('HK416-2020', '2020-11-13', '2021-12-05', 'Unfinished', 'Rifle', 1);


DROP TABLE IF EXISTS notificationbox;
CREATE TABLE notificationbox(
    NotificationID INT AUTO_INCREMENT,
    UserID INT,
    NotificationMessage VARCHAR(200),
    PRIMARY KEY (NotificationID),
	FOREIGN KEY(UserID)
		REFERENCES user(UserID)
        ON UPDATE CASCADE
);

INSERT INTO notificationbox (UserID, NotificationMessage) VALUES
    (1, 'Hey, this is James, I just finished my work.'),
    (2, 'Hi, Manager! I probably need more time.'),
    (3, 'Thank!'),
    (4, 'Hurry Up!, the deadline is coming.'),
    (5, 'I just received your work.');