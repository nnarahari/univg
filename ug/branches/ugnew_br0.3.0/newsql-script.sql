--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `ugbeta`.`corporate` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`corporate_loan_amount` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`user` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`address` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`department` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`university` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`state` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`gender` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`user_role` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`guarantor` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`country` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`programstudy` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`role` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`grantneededfor` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`addresstype` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`loan` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`profile` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`loanstatus` DROP PRIMARY KEY;

ALTER TABLE `ugbeta`.`profile` DROP INDEX `ugbeta`.`genderId`;

ALTER TABLE `ugbeta`.`role` DROP INDEX `ugbeta`.`roleName`;

ALTER TABLE `ugbeta`.`profile` DROP INDEX `ugbeta`.`departmentId`;

ALTER TABLE `ugbeta`.`guarantor` DROP INDEX `ugbeta`.`universityId`;

ALTER TABLE `ugbeta`.`loan` DROP INDEX `ugbeta`.`grantNeededFor`;

ALTER TABLE `ugbeta`.`corporate` DROP INDEX `ugbeta`.`stateId`;

ALTER TABLE `ugbeta`.`university` DROP INDEX `ugbeta`.`university_ibfk_1`;

ALTER TABLE `ugbeta`.`loan` DROP INDEX `ugbeta`.`loanStatusId`;

ALTER TABLE `ugbeta`.`user_role` DROP INDEX `ugbeta`.`FK143BF46A3124AD9A`;

ALTER TABLE `ugbeta`.`loan` DROP INDEX `ugbeta`.`userId`;

ALTER TABLE `ugbeta`.`profile` DROP INDEX `ugbeta`.`universityId`;

ALTER TABLE `ugbeta`.`user` DROP INDEX `ugbeta`.`emailAddress`;

ALTER TABLE `ugbeta`.`profile` DROP INDEX `ugbeta`.`programStudyId`;

ALTER TABLE `ugbeta`.`address` DROP INDEX `ugbeta`.`userId`;

ALTER TABLE `ugbeta`.`address` DROP INDEX `ugbeta`.`stateId`;

ALTER TABLE `ugbeta`.`address` DROP INDEX `ugbeta`.`addressTypeId`;

ALTER TABLE `ugbeta`.`profile` DROP INDEX `ugbeta`.`userId`;

ALTER TABLE `ugbeta`.`guarantor` DROP INDEX `ugbeta`.`genderId`;

ALTER TABLE `ugbeta`.`loan` DROP INDEX `ugbeta`.`address`;

ALTER TABLE `ugbeta`.`guarantor` DROP INDEX `ugbeta`.`userId`;

ALTER TABLE `ugbeta`.`corporate` DROP INDEX `ugbeta`.`userId`;

ALTER TABLE `ugbeta`.`corporate_loan_amount` DROP INDEX `ugbeta`.`corporateId`;

ALTER TABLE `ugbeta`.`user_role` DROP INDEX `ugbeta`.`FK143BF46A379CF084`;

ALTER TABLE `ugbeta`.`guarantor` DROP INDEX `ugbeta`.`stateId`;

DROP TABLE `ugbeta`.`department`;

DROP TABLE `ugbeta`.`programstudy`;

DROP TABLE `ugbeta`.`country`;

DROP TABLE `ugbeta`.`profile`;

DROP TABLE `ugbeta`.`user_role`;

DROP TABLE `ugbeta`.`user`;

DROP TABLE `ugbeta`.`loanstatus`;

DROP TABLE `ugbeta`.`gender`;

DROP TABLE `ugbeta`.`loan`;

DROP TABLE `ugbeta`.`university`;

DROP TABLE `ugbeta`.`role`;

DROP TABLE `ugbeta`.`guarantor`;

DROP TABLE `ugbeta`.`corporate`;

DROP TABLE `ugbeta`.`address`;

DROP TABLE `ugbeta`.`corporate_loan_amount`;

DROP TABLE `ugbeta`.`addresstype`;

DROP TABLE `ugbeta`.`grantneededfor`;

DROP TABLE `ugbeta`.`state`;

CREATE TABLE `ugbeta`.`university` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`university_name` VARCHAR(90) NOT NULL,
	`university_website` VARCHAR(30),
	`address1` VARCHAR(50),
	`address2` VARCHAR(50),
	`city` VARCHAR(50),
	`stateId` BIGINT,
	`country` VARCHAR(20),
	`zip` VARCHAR(10),
	`mobile` VARCHAR(255),
	`phone` VARCHAR(255),
	`enabled` BIT,
	`locked` BIT,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`role` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`roleDescription` VARCHAR(200) NOT NULL,
	`roleName` VARCHAR(255) NOT NULL,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`department` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`departmentName` VARCHAR(255) NOT NULL,
	`departmentDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`programstudy` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`programStudyName` VARCHAR(255) NOT NULL,
	`programStudyDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`country` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`countryName` VARCHAR(255) NOT NULL,
	`countryDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`guarantor` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`userId` BIGINT NOT NULL,
	`universityId` BIGINT NOT NULL,
	`address1` VARCHAR(50) NOT NULL,
	`address2` VARCHAR(50),
	`city` VARCHAR(50) NOT NULL,
	`stateId` BIGINT NOT NULL,
	`country` VARCHAR(20),
	`enabled` BIT,
	`first_name` VARCHAR(50) NOT NULL,
	`genderId` BIGINT NOT NULL,
	`home_page` VARCHAR(30),
	`home_phone` VARCHAR(255),
	`last_name` VARCHAR(50) NOT NULL,
	`linked_in_profile` VARCHAR(75),
	`locked` BIT,
	`middle_name` VARCHAR(30),
	`mobile` VARCHAR(255),
	`work_phone` VARCHAR(255),
	`zip` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`corporate` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`userId` BIGINT NOT NULL,
	`address1` VARCHAR(50) NOT NULL,
	`address2` VARCHAR(50),
	`city` VARCHAR(50) NOT NULL,
	`corporate_linked_in_profile` VARCHAR(75),
	`corporate_name` VARCHAR(20) NOT NULL,
	`corporate_primary_contact` VARCHAR(50) NOT NULL,
	`corporate_website` VARCHAR(30),
	`country` VARCHAR(20),
	`enabled` BIT,
	`industry` VARCHAR(15),
	`locked` BIT,
	`mobile` VARCHAR(255),
	`stateId` BIGINT NOT NULL,
	`work_phone` VARCHAR(255) NOT NULL,
	`zip` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`profile` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`userId` BIGINT NOT NULL,
	`universityId` BIGINT NOT NULL,
	`departmentId` BIGINT NOT NULL,
	`programStudyId` BIGINT NOT NULL,
	`expected_graduation_date` DATETIME,
	`citizenship` VARCHAR(255) NOT NULL,
	`date_of_birth` DATETIME,
	`genderId` BIGINT NOT NULL,
	`home_phone` VARCHAR(10) NOT NULL,
	`linked_in_profile` VARCHAR(255),
	`youtubeurl` VARCHAR(255),
	`mobile` VARCHAR(10) NOT NULL,
	`photoIdentifier` VARCHAR(75),
	`resumeIdentifier` VARCHAR(75),
	`universityEmail` VARCHAR(255),
	`briefDescription` VARCHAR(500),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`address` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`userId` BIGINT NOT NULL,
	`addressTypeId` BIGINT NOT NULL,
	`display_identifier` VARCHAR(25),
	`date_from` DATETIME,
	`date_to` DATETIME,
	`address1` VARCHAR(50) NOT NULL,
	`address2` VARCHAR(50),
	`city` VARCHAR(50) NOT NULL,
	`country` VARCHAR(20),
	`stateId` BIGINT NOT NULL,
	`zip` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`corporate_loan_amount` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`corporateId` BIGINT NOT NULL,
	`available_loan_amount` DECIMAL(10 , 2) NOT NULL,
	`committed_loan_amount` DECIMAL(10 , 2) NOT NULL,
	`loaned_amount` DECIMAL(10 , 2) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`user_role` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`version` INT,
	`roleEntry` BIGINT NOT NULL,
	`userEntry` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`user` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`activationDate` DATETIME,
	`activationKey` VARCHAR(255),
	`emailAddress` VARCHAR(255) NOT NULL,
	`enabled` BIT,
	`firstName` VARCHAR(255) NOT NULL,
	`lastName` VARCHAR(255) NOT NULL,
	`locked` BIT,
	`password` VARCHAR(255) NOT NULL,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`addresstype` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`addressTypeName` VARCHAR(255) NOT NULL,
	`addressTypeDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`loanstatus` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`loanStatusName` VARCHAR(255) NOT NULL,
	`loanStatusDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`grantneededfor` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`grantNeed` VARCHAR(255) NOT NULL,
	`grantNeedDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`state` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`stateName` VARCHAR(255) NOT NULL,
	`stateDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`gender` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`genderName` VARCHAR(6) NOT NULL,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta`.`loan` (
	`id` BIGINT NOT NULL  AUTO_INCREMENT,
	`userId` BIGINT NOT NULL,
	`loan_name` VARCHAR(20),
	`loan_amount` DECIMAL(10 , 2) NOT NULL,
	`grantNeededFor` BIGINT NOT NULL,
	`loan_needed_by` DATETIME NOT NULL,
	`comments` VARCHAR(2000),
	`supportDocumentName` VARCHAR(75),
	`address` BIGINT NOT NULL,
	`loanStatusId` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE INDEX `universityId` ON `ugbeta`.`profile` (`universityId` ASC);

CREATE UNIQUE INDEX `emailAddress` ON `ugbeta`.`user` (`emailAddress` ASC);

CREATE INDEX `genderId` ON `ugbeta`.`profile` (`genderId` ASC);

CREATE UNIQUE INDEX `roleName` ON `ugbeta`.`role` (`roleName` ASC);

CREATE INDEX `programStudyId` ON `ugbeta`.`profile` (`programStudyId` ASC);

CREATE INDEX `userId` ON `ugbeta`.`address` (`userId` ASC);

CREATE INDEX `stateId` ON `ugbeta`.`address` (`stateId` ASC);

CREATE INDEX `departmentId` ON `ugbeta`.`profile` (`departmentId` ASC);

CREATE INDEX `universityId` ON `ugbeta`.`guarantor` (`universityId` ASC);

CREATE INDEX `addressTypeId` ON `ugbeta`.`address` (`addressTypeId` ASC);

CREATE INDEX `userId` ON `ugbeta`.`profile` (`userId` ASC);

CREATE INDEX `grantNeededFor` ON `ugbeta`.`loan` (`grantNeededFor` ASC);

CREATE INDEX `genderId` ON `ugbeta`.`guarantor` (`genderId` ASC);

CREATE INDEX `address` ON `ugbeta`.`loan` (`address` ASC);

CREATE INDEX `stateId` ON `ugbeta`.`corporate` (`stateId` ASC);

CREATE INDEX `university_ibfk_1` ON `ugbeta`.`university` (`stateId` ASC);

CREATE INDEX `loanStatusId` ON `ugbeta`.`loan` (`loanStatusId` ASC);

CREATE INDEX `userId` ON `ugbeta`.`guarantor` (`userId` ASC);

CREATE INDEX `FK143BF46A3124AD9A` ON `ugbeta`.`user_role` (`roleEntry` ASC);

CREATE INDEX `userId` ON `ugbeta`.`corporate` (`userId` ASC);

CREATE INDEX `userId` ON `ugbeta`.`loan` (`userId` ASC);

CREATE INDEX `corporateId` ON `ugbeta`.`corporate_loan_amount` (`corporateId` ASC);

CREATE INDEX `FK143BF46A379CF084` ON `ugbeta`.`user_role` (`userEntry` ASC);

CREATE INDEX `stateId` ON `ugbeta`.`guarantor` (`stateId` ASC);

