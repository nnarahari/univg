--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `ugbeta1`.`corporate` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`corporate_loan_amount` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`user` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`address` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`department` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`university` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`state` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`gender` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`user_role` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`guarantor` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`country` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`programstudy` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`role` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`grantneededfor` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`addresstype` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`loan` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`profile` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`loanstatus` DROP PRIMARY KEY;

ALTER TABLE `ugbeta1`.`profile` DROP INDEX `ugbeta1`.`genderId`;

ALTER TABLE `ugbeta1`.`role` DROP INDEX `ugbeta1`.`roleName`;

ALTER TABLE `ugbeta1`.`profile` DROP INDEX `ugbeta1`.`departmentId`;

ALTER TABLE `ugbeta1`.`guarantor` DROP INDEX `ugbeta1`.`universityId`;

ALTER TABLE `ugbeta1`.`loan` DROP INDEX `ugbeta1`.`grantNeededFor`;

ALTER TABLE `ugbeta1`.`corporate` DROP INDEX `ugbeta1`.`stateId`;

ALTER TABLE `ugbeta1`.`university` DROP INDEX `ugbeta1`.`university_ibfk_1`;

ALTER TABLE `ugbeta1`.`loan` DROP INDEX `ugbeta1`.`loanStatusId`;

ALTER TABLE `ugbeta1`.`user_role` DROP INDEX `ugbeta1`.`FK143BF46A3124AD9A`;

ALTER TABLE `ugbeta1`.`loan` DROP INDEX `ugbeta1`.`userId`;

ALTER TABLE `ugbeta1`.`profile` DROP INDEX `ugbeta1`.`universityId`;

ALTER TABLE `ugbeta1`.`user` DROP INDEX `ugbeta1`.`emailAddress`;

ALTER TABLE `ugbeta1`.`profile` DROP INDEX `ugbeta1`.`programStudyId`;

ALTER TABLE `ugbeta1`.`address` DROP INDEX `ugbeta1`.`userId`;

ALTER TABLE `ugbeta1`.`address` DROP INDEX `ugbeta1`.`stateId`;

ALTER TABLE `ugbeta1`.`address` DROP INDEX `ugbeta1`.`addressTypeId`;

ALTER TABLE `ugbeta1`.`profile` DROP INDEX `ugbeta1`.`userId`;

ALTER TABLE `ugbeta1`.`guarantor` DROP INDEX `ugbeta1`.`genderId`;

ALTER TABLE `ugbeta1`.`loan` DROP INDEX `ugbeta1`.`address`;

ALTER TABLE `ugbeta1`.`guarantor` DROP INDEX `ugbeta1`.`userId`;

ALTER TABLE `ugbeta1`.`corporate` DROP INDEX `ugbeta1`.`userId`;

ALTER TABLE `ugbeta1`.`corporate_loan_amount` DROP INDEX `ugbeta1`.`corporateId`;

ALTER TABLE `ugbeta1`.`user_role` DROP INDEX `ugbeta1`.`FK143BF46A379CF084`;

ALTER TABLE `ugbeta1`.`guarantor` DROP INDEX `ugbeta1`.`stateId`;

DROP TABLE `ugbeta1`.`department`;

DROP TABLE `ugbeta1`.`programstudy`;

DROP TABLE `ugbeta1`.`country`;

DROP TABLE `ugbeta1`.`profile`;

DROP TABLE `ugbeta1`.`user_role`;

DROP TABLE `ugbeta1`.`user`;

DROP TABLE `ugbeta1`.`loanstatus`;

DROP TABLE `ugbeta1`.`gender`;

DROP TABLE `ugbeta1`.`loan`;

DROP TABLE `ugbeta1`.`university`;

DROP TABLE `ugbeta1`.`role`;

DROP TABLE `ugbeta1`.`guarantor`;

DROP TABLE `ugbeta1`.`corporate`;

DROP TABLE `ugbeta1`.`address`;

DROP TABLE `ugbeta1`.`corporate_loan_amount`;

DROP TABLE `ugbeta1`.`addresstype`;

DROP TABLE `ugbeta1`.`grantneededfor`;

DROP TABLE `ugbeta1`.`state`;

CREATE TABLE `ugbeta1`.`university` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`role` (
	`id` BIGINT NOT NULL,
	`roleDescription` VARCHAR(200) NOT NULL,
	`roleName` VARCHAR(255) NOT NULL,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`department` (
	`id` BIGINT NOT NULL,
	`departmentName` VARCHAR(255) NOT NULL,
	`departmentDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`programstudy` (
	`id` BIGINT NOT NULL,
	`programStudyName` VARCHAR(255) NOT NULL,
	`programStudyDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`country` (
	`id` BIGINT NOT NULL,
	`countryName` VARCHAR(255) NOT NULL,
	`countryDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`guarantor` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`corporate` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`profile` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`address` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`corporate_loan_amount` (
	`id` BIGINT NOT NULL,
	`corporateId` BIGINT NOT NULL,
	`available_loan_amount` DECIMAL(10 , 2) NOT NULL,
	`committed_loan_amount` DECIMAL(10 , 2) NOT NULL,
	`loaned_amount` DECIMAL(10 , 2) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`user_role` (
	`id` BIGINT NOT NULL,
	`version` INT,
	`roleEntry` BIGINT NOT NULL,
	`userEntry` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`user` (
	`id` BIGINT NOT NULL,
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

CREATE TABLE `ugbeta1`.`addresstype` (
	`id` BIGINT NOT NULL,
	`addressTypeName` VARCHAR(255) NOT NULL,
	`addressTypeDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`loanstatus` (
	`id` BIGINT NOT NULL,
	`loanStatusName` VARCHAR(255) NOT NULL,
	`loanStatusDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`grantneededfor` (
	`id` BIGINT NOT NULL,
	`grantNeed` VARCHAR(255) NOT NULL,
	`grantNeedDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`state` (
	`id` BIGINT NOT NULL,
	`stateName` VARCHAR(255) NOT NULL,
	`stateDescription` VARCHAR(200),
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`gender` (
	`id` BIGINT NOT NULL,
	`genderName` VARCHAR(6) NOT NULL,
	`version` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ugbeta1`.`loan` (
	`id` BIGINT NOT NULL,
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

CREATE INDEX `universityId` ON `ugbeta1`.`profile` (`universityId` ASC);

CREATE UNIQUE INDEX `emailAddress` ON `ugbeta1`.`user` (`emailAddress` ASC);

CREATE INDEX `genderId` ON `ugbeta1`.`profile` (`genderId` ASC);

CREATE UNIQUE INDEX `roleName` ON `ugbeta1`.`role` (`roleName` ASC);

CREATE INDEX `programStudyId` ON `ugbeta1`.`profile` (`programStudyId` ASC);

CREATE INDEX `userId` ON `ugbeta1`.`address` (`userId` ASC);

CREATE INDEX `stateId` ON `ugbeta1`.`address` (`stateId` ASC);

CREATE INDEX `departmentId` ON `ugbeta1`.`profile` (`departmentId` ASC);

CREATE INDEX `universityId` ON `ugbeta1`.`guarantor` (`universityId` ASC);

CREATE INDEX `addressTypeId` ON `ugbeta1`.`address` (`addressTypeId` ASC);

CREATE INDEX `userId` ON `ugbeta1`.`profile` (`userId` ASC);

CREATE INDEX `grantNeededFor` ON `ugbeta1`.`loan` (`grantNeededFor` ASC);

CREATE INDEX `genderId` ON `ugbeta1`.`guarantor` (`genderId` ASC);

CREATE INDEX `address` ON `ugbeta1`.`loan` (`address` ASC);

CREATE INDEX `stateId` ON `ugbeta1`.`corporate` (`stateId` ASC);

CREATE INDEX `university_ibfk_1` ON `ugbeta1`.`university` (`stateId` ASC);

CREATE INDEX `loanStatusId` ON `ugbeta1`.`loan` (`loanStatusId` ASC);

CREATE INDEX `userId` ON `ugbeta1`.`guarantor` (`userId` ASC);

CREATE INDEX `FK143BF46A3124AD9A` ON `ugbeta1`.`user_role` (`roleEntry` ASC);

CREATE INDEX `userId` ON `ugbeta1`.`corporate` (`userId` ASC);

CREATE INDEX `userId` ON `ugbeta1`.`loan` (`userId` ASC);

CREATE INDEX `corporateId` ON `ugbeta1`.`corporate_loan_amount` (`corporateId` ASC);

CREATE INDEX `FK143BF46A379CF084` ON `ugbeta1`.`user_role` (`userEntry` ASC);

CREATE INDEX `stateId` ON `ugbeta1`.`guarantor` (`stateId` ASC);

