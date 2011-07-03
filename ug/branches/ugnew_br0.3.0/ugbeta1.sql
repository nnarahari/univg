CREATE TABLE grantNeededFor (
	id BIGINT NOT NULL AUTO_INCREMENT,
	grantNeed VARCHAR(255) NOT NULL,
	grantNeedDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE state (
	id BIGINT NOT NULL AUTO_INCREMENT,
	stateName VARCHAR(255) NOT NULL,
	stateDescription VARCHAR(200),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE country (
	id BIGINT NOT NULL AUTO_INCREMENT,
	countryName VARCHAR(255) NOT NULL,
	countryDescription VARCHAR(200),
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
	university_name VARCHAR(90) NOT NULL,
	university_website VARCHAR(30),
	address1 VARCHAR(50),
	address2 VARCHAR(50),
	city VARCHAR(50),
	stateId bigint,
	country VARCHAR(20),
	zip VARCHAR(10),
	mobile VARCHAR(255),
	phone VARCHAR(255),
	enabled BIT,
	locked BIT,
	version INT,
	PRIMARY KEY (id)
	
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

CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `universityId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `programStudyId` bigint(20) NOT NULL,
  `expected_graduation_date` datetime DEFAULT NULL,
  `citizenship` bigint(20) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `genderId` bigint(20) NOT NULL,
  `home_phone` varchar(10) NOT NULL,
  `linked_in_profile` varchar(255) DEFAULT NULL,
  `youtubeurl` varchar(255) DEFAULT NULL,
  `mobile` varchar(10) NOT NULL,
  `photoIdentifier` varchar(75) DEFAULT NULL,
  `resumeIdentifier` varchar(75) DEFAULT NULL,
  `universityEmail` varchar(255) DEFAULT NULL,
  `briefDescription` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `universityId` (`universityId`),
  KEY `departmentId` (`departmentId`),
  KEY `programStudyId` (`programStudyId`),
  KEY `genderId` (`genderId`),
  KEY `profile_ibfk_6` (`citizenship`),
  CONSTRAINT `profile_ibfk_6` FOREIGN KEY (`citizenship`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`universityId`) REFERENCES `university` (`id`),
  CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `profile_ibfk_4` FOREIGN KEY (`programStudyId`) REFERENCES `programstudy` (`id`),
  CONSTRAINT `profile_ibfk_5` FOREIGN KEY (`genderId`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1$$



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
	loan_name VARCHAR(20),
	loan_amount DECIMAL(10 , 2) NOT NULL,
	grantNeededFor bigint not null,
	loan_needed_by DATETIME NOT NULL,
	comments VARCHAR(2000),
	supportDocumentName VARCHAR(75),
	loanStatusId BIGINT not null,
	address BIGINT not null,
	PRIMARY KEY (id),
	FOREIGN KEY (userId) REFERENCES user(id),
	FOREIGN KEY (grantNeededFor) REFERENCES grantNeededFor(id),
	FOREIGN KEY (address) REFERENCES address(id),
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



CREATE TABLE profession (
	id BIGINT NOT NULL AUTO_INCREMENT,
	professionName VARCHAR(200) NOT NULL,
	professionDescription VARCHAR(255),
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE `mentor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `citizenship` bigint(20) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `genderId` bigint(20) NOT NULL,
  `currentProfession` bigint(20) NOT NULL,
  `home_phone` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `linked_in_profile` varchar(255) DEFAULT NULL,
  `youtubeurl` varchar(255) DEFAULT NULL,
  `photoIdentifier` varchar(75) DEFAULT NULL,
  `why` varchar(2000) DEFAULT NULL,
   openToAcceptMentee BIT,
   enabled BIT,
   loacked BIT,
  PRIMARY KEY (`id`),
  KEY `mentor_ibfk_1` (`userId`),
  KEY `mentor_ibfk_2` (`genderId`),
  KEY `mentee_ibfk_4` (`currentProfession`),
  KEY `mentor_ibfk_3` (`citizenship`),
  CONSTRAINT `mentor_ibfk_3` FOREIGN KEY (`citizenship`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `mentor_ibfk_2` FOREIGN KEY (`genderId`) REFERENCES `gender` (`id`),
  CONSTRAINT `mentee_ibfk_4` FOREIGN KEY (`currentProfession`) REFERENCES `profession` (`id`)
) ENGINE=InnoDB;

delimiter $$

CREATE TABLE `mentee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `citizenship` bigint(20) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `genderId` bigint(20) NOT NULL,
  `programStudyId` bigint(20) NOT NULL,
  `currentProfession` bigint(20) NOT NULL,
  `attended` varchar(200) DEFAULT NULL,
  `home_phone` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `linked_in_profile` varchar(255) DEFAULT NULL,
  `youtubeurl` varchar(255) DEFAULT NULL,
  `photoIdentifier` varchar(75) DEFAULT NULL,
  `why` varchar(250) DEFAULT NULL,
  `lookingForMentor` bit(1) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mentee_ibfk_11` (`userId`),
  KEY `mentee_ibfk_22` (`genderId`),
  KEY `mentee_ibfk_33` (`citizenship`),
  KEY `mentee_ibfk_55` (`currentProfession`),
  KEY `mentee_ibfk_44` (`programStudyId`),
  CONSTRAINT `mentee_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentee_ibfk_22` FOREIGN KEY (`genderId`) REFERENCES `gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentee_ibfk_33` FOREIGN KEY (`citizenship`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentee_ibfk_55` FOREIGN KEY (`currentProfession`) REFERENCES `profession` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mentee_ibfk_44` FOREIGN KEY (`programStudyId`) REFERENCES `programstudy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$


CREATE TABLE mentor_mentee (
	id BIGINT NOT NULL AUTO_INCREMENT,
	version INT,
	mentor BIGINT NOT NULL,
	mentee BIGINT NOT NULL,
	fromDate DATETIME DEFAULT NULL,
	deactivationDate DATETIME DEFAULT NULL,
	deleted BIT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;


CREATE TABLE testimonial (
	id BIGINT NOT NULL AUTO_INCREMENT,
	userId BIGINT NOT NULL,
	role BIGINT NOT NULL,
	Date DATETIME DEFAULT NULL,
	deleted BIT,
	validated BIT,
	version INT,
	PRIMARY KEY (id)
) ENGINE=InnoDB;
