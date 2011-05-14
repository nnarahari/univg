CREATE TABLE state (
	id BIGINT NOT NULL AUTO_INCREMENT,
	stateName VARCHAR(255) NOT NULL,
	stateDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE department (
	id BIGINT NOT NULL AUTO_INCREMENT,
	departmentName VARCHAR(255) NOT NULL,
	departmentDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE programStudy (
	id BIGINT NOT NULL AUTO_INCREMENT,
	programStudyName VARCHAR(255) NOT NULL,
	programStudyDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE loanStatus (
	id BIGINT NOT NULL AUTO_INCREMENT,
	loanStatusName VARCHAR(255) NOT NULL,
	loanStatusDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE addressType (
	id BIGINT NOT NULL AUTO_INCREMENT,
	addressTypeName VARCHAR(255) NOT NULL,
	addressTypeDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE gender (
	id BIGINT NOT NULL AUTO_INCREMENT,
	genderName VARCHAR(6) NOT NULL,
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE user (
	id BIGINT NOT NULL AUTO_INCREMENT ,
	activationDate DATETIME,
	activationKey VARCHAR(255),
	emailAddress VARCHAR(255) NOT NULL,
	enabled BIT,
	firstName VARCHAR(255) NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	locked BIT,
	password VARCHAR(255) NOT NULL,
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE role (
	id BIGINT NOT NULL AUTO_INCREMENT,
	roleDescription VARCHAR(200) NOT NULL,
	roleName VARCHAR(255) NOT NULL,
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE user_role (
	id BIGINT NOT NULL AUTO_INCREMENT,
	version INT,
	roleEntry BIGINT NOT NULL,
	userEntry BIGINT NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE UNIQUE INDEX roleName ON role (roleName ASC);

CREATE UNIQUE INDEX emailAddress ON user (emailAddress ASC);

CREATE INDEX FK143BF46A379CF084 ON user_role (userEntry ASC);

CREATE INDEX FK143BF46A3124AD9A ON user_role (roleEntry ASC);

CREATE TABLE university (
	id BIGINT NOT NULL AUTO_INCREMENT,
	university_name VARCHAR(20) NOT NULL,
	university_website VARCHAR(30),
	address1 VARCHAR(50) NOT NULL,
	address2 VARCHAR(50),
	city VARCHAR(50) NOT NULL,
	stateId bigint not null,
	country VARCHAR(20),
	zip VARCHAR(10) NOT NULL,
	mobile VARCHAR(255),
	phone VARCHAR(255) NOT NULL,
	enabled BIT,
	locked BIT,
	version INT,
	PRIMARY KEY (id),
	FOREIGN KEY (stateId) REFERENCES state(id)

) ENGINE=InnoDB;

CREATE TABLE guarantor (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId bigint not null,
	universityId bigint not null,
	address1 VARCHAR(50) NOT NULL,
	address2 VARCHAR(50),
	city VARCHAR(50) NOT NULL,
	stateId bigint not null,
	country VARCHAR(20),
	enabled BIT,
	first_name VARCHAR(50) NOT NULL,
	genderId bigint not null,
	home_page VARCHAR(30),
	home_phone VARCHAR(255),
	last_name VARCHAR(50) NOT NULL,
	linked_in_profile VARCHAR(75),
	locked BIT,
	middle_name VARCHAR(30),
	mobile VARCHAR(255),
	work_phone VARCHAR(255),
	zip VARCHAR(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (universityId) REFERENCES university(id),
	FOREIGN KEY (stateId) REFERENCES state(id),
	FOREIGN KEY (genderId) REFERENCES gender(id)
	

) ENGINE=InnoDB;

CREATE TABLE profile (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId bigint not null,
	universityId bigint not null,
	departmentId bigint not null,
	programStudyId bigint not null,
	expected_graduation_date DATETIME,
	citizenship VARCHAR(255) NOT NULL,
	date_of_birth DATETIME,
	genderId bigint not null,
	home_phone VARCHAR(10) NOT NULL,
	linked_in_profile VARCHAR(75),
	mobile VARCHAR(10) NOT NULL,
	photoIdentifier VARCHAR(75),
	resumeIdentifier VARCHAR(75),
	universityEmail VARCHAR(255),
	PRIMARY KEY (id),
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (universityId) REFERENCES university(id),
	FOREIGN KEY (departmentId) REFERENCES department(id),
	FOREIGN KEY (programStudyId) REFERENCES programStudy(id),
	FOREIGN KEY (genderId) REFERENCES gender(id)
) ENGINE=InnoDB;

CREATE TABLE address (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId bigint not null,
	addressTypeId bigint not null,
	display_identifier VARCHAR(25),
	date_from DATETIME,
	date_to DATETIME,
	address1 VARCHAR(50) NOT NULL,
	address2 VARCHAR(50),
	city VARCHAR(50) NOT NULL,
	country VARCHAR(20),
	stateId bigint not null,
	zip VARCHAR(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (stateId) REFERENCES state(id),
	FOREIGN KEY (addressTypeId) REFERENCES addressType(id)
) ENGINE=InnoDB;


CREATE TABLE loan (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId bigint not null,
	guarantorId BIGINT not null,
	loan_name VARCHAR(20),
	loan_amount DECIMAL(10 , 2) NOT NULL,
	loan_naeeded_for VARCHAR(200),
	loan_needed_by DATETIME NOT NULL,
	loan_period INT NOT NULL,
	loanStatusId BIGINT not null,
	comments VARCHAR(2000),
	PRIMARY KEY (id),
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (guarantorId) REFERENCES guarantor(id),
	FOREIGN KEY (loanStatusId) REFERENCES loanStatus(id)	

) ENGINE=InnoDB;

CREATE TABLE corporate (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId bigint not null,
	address1 VARCHAR(50) NOT NULL,
	address2 VARCHAR(50),
	city VARCHAR(50) NOT NULL,
	corporate_linked_in_profile VARCHAR(75),
	corporate_name VARCHAR(20) NOT NULL,
	corporate_primary_contact VARCHAR(50) NOT NULL,
	corporate_website VARCHAR(30),
	country VARCHAR(20),
	enabled BIT,
	industry VARCHAR(15),
	locked BIT,
	mobile VARCHAR(255),
	stateId bigint not null,
	work_phone VARCHAR(255) NOT NULL,
	zip VARCHAR(10) NOT NULL,
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (stateId) REFERENCES state(id),
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE corporate_loan_amount (
	id BIGINT NOT NULL AUTO_INCREMENT,
    corporateId bigint not null,
	available_loan_amount DECIMAL(10 , 2) NOT NULL,
	committed_loan_amount DECIMAL(10 , 2) NOT NULL,
	loaned_amount DECIMAL(10 , 2) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (corporateId) REFERENCES corporate(id) 
) ENGINE=InnoDB;
