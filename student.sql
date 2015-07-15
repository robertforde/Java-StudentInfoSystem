/*
SQLyog Ultimate v8.55 
MySQL - 5.6.17 : Database - student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `student`;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `Sid` varchar(20) DEFAULT NULL,
  `Sname` varchar(20) DEFAULT NULL,
  `Subject` varchar(20) DEFAULT NULL,
  `Present` int(3) DEFAULT NULL,
  `Absent` int(3) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `studentid` (`Sid`),
  CONSTRAINT `student` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`),
  CONSTRAINT `studentid` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `attendance` */

insert  into `attendance`(`Sid`,`Sname`,`Subject`,`Present`,`Absent`,`ID`) values ('IT6539249','Robert','JSP',32,2,1),('IT6539249','Robert','HTML',34,3,3),('IT6539249','Robert','CSS',28,1,4),('IT6539249','Robert','Servlets',30,0,5),('IT6539250','Debbie','JSP',30,4,7),('IT6539250','Debbie','EL',31,3,8),('IT6539250','Debbie','HTML',31,6,9),('IT6539250','Debbie','CSS',29,0,10),('IT6539250','Debbie','Servlets',25,5,11),('IT6539250','Debbie','JDBC',31,1,12),('AC5667532','Howard','Accounting - Man/Com',40,3,13),('AC5667532','Howard','Business Admin',35,2,14),('AC5667532','Howard','Marketing Practice',38,6,15),('AC5667532','Howard','Statistics',42,1,16),('AC5667532','Howard','Business Law',34,0,17),('AC5667532','Howard','Applied Economics',43,1,18),('IT6539251','Raymond','JSP',31,3,22),('IT6539249','Robert','JDBC',30,2,23),('AC5667533','Patrick','Applied Economics',0,0,24),('AC5667533','Patrick','Business Admin',0,0,25),('AC5667533','Patrick','Marketing Practice',0,0,26),('AC5667533','Patrick','Statistics',0,0,27),('IT6539249','Robert','EL',34,0,28),('IT6539249','Robert','Spring',40,0,29),('AC5667553','tom','Corporate Accounting',33,1,30);

/*Table structure for table `attendance_semester` */

DROP TABLE IF EXISTS `attendance_semester`;

CREATE TABLE `attendance_semester` (
  `Sid` varchar(20) NOT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `Semester1` int(3) DEFAULT NULL,
  `Semester2` int(3) DEFAULT NULL,
  `Semester3` int(3) DEFAULT NULL,
  `Semester4` int(3) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `studentsemester` (`Sid`),
  CONSTRAINT `studentsemester` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `attendance_semester` */

insert  into `attendance_semester`(`Sid`,`Sname`,`Semester1`,`Semester2`,`Semester3`,`Semester4`,`Year`,`ID`) values ('IT6539249','Robert',29,32,30,32,2010,1),('AC5667532','Howard',33,33,29,32,2010,3),('IT6539249','Robert',56,67,59,52,2012,5),('IT6539251','Raymond',29,34,45,42,2010,7),('AC5667533','Patrick',34,36,33,39,2010,13),('AC5667533','Patrick',39,38,39,38,2011,14),('IT6539249','Robert',30,33,34,45,2011,15);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cno` int(11) NOT NULL DEFAULT '0',
  `cname` varchar(15) DEFAULT NULL,
  `dname` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`cno`,`dname`),
  KEY `dname` (`dname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `course` */

insert  into `course`(`cno`,`cname`,`dname`) values (111,'Operating Syste','Computer Scienc'),(222,'Artificial Inte','Computer Scienc'),(333,'Algorithms','Computer Scienc'),(123,'Physiology','Biology'),(233,'Microbiology','Biology'),(332,'Botany','Biology'),(122,'Topology','Mathematics'),(224,'Differential Ge','Mathematics'),(312,'Algebra','Mathematics'),(154,'Tonal Theory','Music'),(342,'Musicianship','Music'),(453,'Music of the Ro','Music'),(221,'Quantum Mechani','Physics'),(332,'General Relativ','Physics'),(543,'Electrodynamics','Physics'),(221,'Microeconomic T','Economics'),(112,'Intermediate Ma','Economics'),(111,'Quantitative Me','Economics');

/*Table structure for table `day` */

DROP TABLE IF EXISTS `day`;

CREATE TABLE `day` (
  `ID` int(11) unsigned NOT NULL,
  `Day` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `day` */

insert  into `day`(`ID`,`Day`) values (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `Department_Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Abbreviation` varchar(2) DEFAULT NULL,
  `NextNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`Department_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`Department_Id`,`Name`,`Abbreviation`,`NextNum`) values (1,'Information Tecnology','IT',6539269),(2,'Accounting','AC',5667554),(3,'Science','SC',4324349),(4,'Law','LW',3432447);

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `dname` varchar(15) NOT NULL DEFAULT '',
  `numphds` int(11) DEFAULT NULL,
  PRIMARY KEY (`dname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `dept` */

insert  into `dept`(`dname`,`numphds`) values ('Computer Scienc',40),('Biology',65),('Music',22),('Mathematics',21),('Physics',38),('Economics',45);

/*Table structure for table `enroll` */

DROP TABLE IF EXISTS `enroll`;

CREATE TABLE `enroll` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `grade` char(1) DEFAULT NULL,
  `dname` varchar(15) NOT NULL DEFAULT '',
  `cno` int(11) NOT NULL DEFAULT '0',
  `sectno` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`,`dname`,`cno`,`sectno`),
  KEY `cno` (`cno`,`dname`),
  KEY `dname` (`dname`,`cno`,`sectno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `enroll` */

insert  into `enroll`(`sid`,`grade`,`dname`,`cno`,`sectno`) values (1,'A','Computer Scienc',111,1),(1,'A','Computer Scienc',333,2),(1,'A','Mathematics',312,2),(7,'A','Computer Scienc',111,1),(7,'B','Computer Scienc',333,1),(7,'B','Physics',332,2),(13,'A','Computer Scienc',111,1),(13,'C','Music',154,2),(19,'A','Computer Scienc',111,1),(19,'D','Economics',111,1),(19,'A','Biology',332,1),(16,'A','Mathematics',312,1),(16,'B','Mathematics',224,1),(10,'B','Mathematics',312,2),(10,'B','Mathematics',224,2),(10,'B','Physics',332,2),(22,'A','Mathematics',224,2),(22,'C','Physics',332,2),(22,'A','Computer Scienc',333,1),(28,'A','Mathematics',224,2),(28,'B','Biology',332,1),(14,'A','Biology',332,2),(14,'B','Biology',233,1),(20,'A','Biology',332,1),(20,'C','Biology',233,1),(20,'B','Economics',111,1),(26,'A','Biology',332,2),(26,'A','Music',154,1),(9,'A','Music',154,1),(9,'B','Music',342,2),(15,'A','Music',154,2),(15,'B','Music',342,2),(21,'A','Music',342,2),(21,'A','Economics',112,2),(27,'B','Music',342,2),(27,'C','Economics',112,2),(27,'B','Mathematics',224,2),(11,'A','Physics',221,1),(11,'B','Physics',332,2),(17,'A','Physics',221,1),(17,'A','Physics',332,1),(17,'C','Computer Scienc',333,1),(23,'A','Physics',221,1),(23,'B','Mathematics',312,2),(23,'B','Mathematics',224,2),(29,'A','Physics',221,1),(6,'A','Economics',112,2),(12,'A','Economics',112,2),(12,'B','Economics',111,1),(18,'A','Economics',112,2),(18,'B','Economics',111,1),(24,'A','Economics',112,1);

/*Table structure for table `fee` */

DROP TABLE IF EXISTS `fee`;

CREATE TABLE `fee` (
  `Sid` varchar(20) DEFAULT NULL,
  `Sname` varchar(20) DEFAULT NULL,
  `Semester` varchar(3) DEFAULT NULL,
  `Fees` float DEFAULT NULL,
  `Charge` float DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Year` int(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `studentfee` (`Sid`),
  CONSTRAINT `studentfee` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `fee` */

insert  into `fee`(`Sid`,`Sname`,`Semester`,`Fees`,`Charge`,`ID`,`Year`) values ('IT6539249','Robert','1st',1000,100,1,2010),('IT6539250','Debbie','1st',4000,1000,5,2010),('IT6539250','Debbie','2nd',4000,0,6,2010),('IT6539250','Debbie','3rd',2000,0,7,2010),('IT6539250','Debbie','4th',1000,1000,8,2010),('AC5667532','Howard','1st',5000,1000,9,2010),('AC5667532','Howard','2nd',8000,0,10,2010),('AC5667532','Howard','2nd',8000,0,11,2010),('AC5667532','Howard','2nd',8000,0,12,2010),('IT6539249','Robert','2nd',1000,200,13,2010),('AC5667533','Patrick','1st',1000,100,16,2010),('AC5667533','Patrick','2nd',750,0,17,2011),('IT6539251','Raymond','1st',1000,100,18,2010),('IT6539249','Robert','3rd',1000,500,19,2010),('IT6539249','Robert','4th',1000,100,20,2010),('IT6539249','Robert','1st',0,200,21,2010);

/*Table structure for table `library` */

DROP TABLE IF EXISTS `library`;

CREATE TABLE `library` (
  `Sid` varchar(20) DEFAULT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `BookName` varchar(50) DEFAULT NULL,
  `BookIssued` date DEFAULT NULL,
  `BookReturn` date DEFAULT NULL,
  `Fines` float DEFAULT NULL,
  `Paid` float DEFAULT NULL,
  `Balance` float DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `studentlibrary` (`Sid`),
  CONSTRAINT `studentlibrary` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `library` */

insert  into `library`(`Sid`,`Sname`,`BookName`,`BookIssued`,`BookReturn`,`Fines`,`Paid`,`Balance`,`ID`) values ('IT6539249','Robert','Java Fundamentals','2013-03-05',NULL,14.55,0,14.55,1),('IT6539249','Robert','Advanced JSP Programming','2013-05-23','2013-06-23',8.75,5,3.75,2),('IT6539249','Robert','HTML for Beginners','2013-06-19','2013-06-26',0,0,0,3),('IT6539249','Robert','CSS Designs','2013-02-10','2013-02-27',0,0,0,4),('IT6539250','Debbie','OCPJP Book','2013-02-27',NULL,43.12,0,43.12,7),('IT6539250','Debbie','Head First JSP/Servlets','2013-03-10','2013-03-25',0,0,0,8),('IT6539250','Debbie','JDBC for Beginners','2013-04-25','2013-05-15',3.68,3.68,0,9),('AC5667532','Howard','Accountancy 123','2013-01-01','2013-02-01',2.5,2.5,0,10),('AC5667532','Howard','Business Law for Dummies','2013-02-23','2013-03-12',0,0,0,11),('AC5667532','Howard','Statictics for Muppets','2013-03-12',NULL,12.87,2.87,10,12),('IT6539249','Robert','Advanced HTML','2013-04-01',NULL,27.46,10,17.46,14),('AC5667533','Patrick','Accounting for Dummies','2010-01-01','2010-01-28',0,0,0,15),('IT6539249','Robert','Java Fundamentals',NULL,NULL,13.82,9.42,0,16);

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `dname` varchar(15) NOT NULL DEFAULT '',
  `sid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dname`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `major` */

insert  into `major`(`dname`,`sid`) values ('Biology',2),('Biology',8),('Biology',14),('Biology',20),('Biology',26),('Computer Scienc',1),('Computer Scienc',7),('Computer Scienc',13),('Computer Scienc',19),('Computer Scienc',25),('Economics',6),('Economics',12),('Economics',18),('Economics',24),('Mathematics',4),('Mathematics',10),('Mathematics',16),('Mathematics',22),('Mathematics',28),('Music',3),('Music',9),('Music',15),('Music',21),('Music',27),('Physics',5),('Physics',11),('Physics',17),('Physics',23),('Physics',29);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `FromName` varchar(10) DEFAULT NULL,
  `FromId` varchar(20) DEFAULT NULL,
  `ToId` varchar(20) DEFAULT NULL,
  `Message` varchar(250) DEFAULT NULL,
  `Checked` tinyint(1) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`FromName`,`FromId`,`ToId`,`Message`,`Checked`,`ID`) values ('Debbie','IT6539250','IT6539249','How did you do on the Java Dundamentals exam. I found that the 2nd generics question was confusing and thought that it was maybe a typo error.',1,1),('Robert','IT6539249','IT6539250','Yeah it was a bit confusing but I think I managed to work it out correctly. What did you think of the Servlets exam?',1,2),('Debbie','IT6539250','IT6539249','It was fine, are you going to watch our football team in the cup match.',1,3),('Howard','AC5667532','IT6539249','So Rob are you going to the football match?',1,4),('Robert','IT6539249','AC5667532','Yeah sure I\'ll be there, but I\'ve got some more exams coming up soon.',1,5),('Robert','IT6539249','IT6539250','I\'ll be there Debbie and my friend Howard is coming too.',1,6),('Debbie','IT6539250','IT6539249','See you there!',1,7),('Howard','AC5667532','IT6539249','I\'ll see you there!',1,8),('Howard','AC5667532','IT6539249 ','Are they really diffucult exams?',1,9),('Howard','AC5667532','IT6539249','This is my test message!',1,10),('Robert','IT6539249','IT6539250','tester',1,11),('Robert','IT6539249','IT6539250','Just making sure the messages are being sent!',1,12),('Robert','IT6539249','IT6539255','test',0,13),('Robert','IT6539249','IT6539249','testing message to me!',0,14),('Noel','AC5667536','IT6539249','This is a test message to Robert.',0,16),('Robert','IT6539249','AC5667536','Got your test message, Noel!',0,28),('Robert','IT6539249','IT6539250','Hi Debbie, did you manage to source the new book that we need.',0,29);

/*Table structure for table `prof` */

DROP TABLE IF EXISTS `prof`;

CREATE TABLE `prof` (
  `pname` varchar(15) NOT NULL DEFAULT '',
  `dname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pname`),
  KEY `dname` (`dname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `prof` */

insert  into `prof`(`pname`,`dname`) values ('Wolfgang Finkel','Physics'),('William Keck','Physics'),('Stephanie Zacha','Music'),('Stephen Hunter','Music'),('Patrick Dean','Biology'),('Jason Singer','Biology'),('Cornelia von Zi','Mathematics'),('Yvonne Rauwald','Mathematics'),('Kareem Fahim','Computer Scienc'),('Francesco O\'Gra','Computer Scienc'),('Jennifer Waters','Economics'),('Emmanuel Keoun','Economics');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `Sid` varchar(20) DEFAULT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `Subject` varchar(20) DEFAULT NULL,
  `GPA` float DEFAULT NULL,
  `Obtained` tinyint(3) DEFAULT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `studentresult` (`Sid`),
  CONSTRAINT `studentresult` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`Sid`,`Sname`,`Year`,`Subject`,`GPA`,`Obtained`,`ID`) values ('IT6539249','Robert',2013,'JSP',4.25,85,1),('IT6539250','Debbie',2013,'JSP',4.5,90,2),('AC5667532','Howard',2013,'Accounting - Man/Com',4.1,82,3),('IT6539249','Robert',2013,'JDBC',3.75,75,4),('IT6539249','Robert',2013,'Servlets',3.5,70,5),('IT6539249','Robert',2013,'CSS',3.25,65,7),('IT6539250','Debbie',2013,'JDBC',4,80,9),('IT6539250','Debbie',2013,'Servlets',2.75,55,10),('IT6539250','Debbie',2013,'EL',3.1,62,11),('IT6539250','Debbie',2013,'CSS',3.9,78,12),('IT6539250','Debbie',2013,'HTML',3.45,69,13),('AC5667532','Howard',2013,'Business Admin',3.35,67,14),('AC5667532','Howard',2013,'Marketing Practice',4.85,97,15),('AC5667532','Howard',2013,'Statistics',4.15,83,16),('AC5667532','Howard',2013,'Business Law',4.55,91,17),('AC5667532','Howard',2013,'Applied Economics',3.15,63,18),('AC5667533','Patrick',2010,'Business Admin',4,80,21),('IT6539249','Robert',2013,'HTML',4.4,88,22);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `Sid` varchar(20) NOT NULL,
  `Sname` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Father_name` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Department_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`Sid`,`Sname`,`Password`,`Father_name`,`DOB`,`Nationality`,`Address`,`City`,`Country`,`Phone`,`Mobile`,`Email`,`Department_Id`) values ('AC5667532','Howard','howard','Jones','1993-04-23','Scottish','46 Noth Thumerland Lane Glasgow','Glasgow','Scotland','45454547','0767567567','hjones@hotmail.com',2),('AC5667533','Patrick','patrick','Whelan','1982-07-02','Irish','16 Lower Trane Road, Donegal','Donegal','Co. Donegal','076334637','','pwhelan@gmail.com',2),('AC5667534','Niamh','niamh','Johnson','1984-04-23','English','15 Sussex Street, London PO43543','London','England','0445273672','077536433','njohnson@gmail.com',2),('AC5667535','joe','joe','bloggs','1974-05-03','Irish','gtreg','','yuy','vy','vhjv','vjh',2),('AC5667536','Noel','noel','Preston','1981-03-25','Irish','64 Lowry Drive, Bray, Co. Wicklow','Bray','Wicklow','062767273','0864537291','noel67@hotmail.com',2),('AC5667553','tom','tom','tum','1998-10-01','American','43uri4ureuwifh','Dublin','Ireland','45354354','5435435','',2),('IT6539249','Robert','robert','Forde','1973-06-11','Irish','6 Gardner Street, Dublin 1','Dublin','Ireland','323232256','0854548444','rforde@hotmail.com',1),('IT6539250','Debbie','debbie','Walker','1985-10-16','Irish','45 Main Street, Galway','Galway','Ireland','7627434','087263984','dwalker@gmail.com',1),('IT6539251','Raymond','raymond','Jones','1994-03-12','Irish','23 Main Street, Arklow, Co. Wicklow','Arklow','Ireland','07843433','087323232','rjones@hotmail.com ',1),('IT6539252','David','david','Smith','1994-02-14','Irish','3 Talbot Street, Dublin 1','Dublin','Ireland','01567567','0866435643','dsmith@hotmail.com',1),('IT6539253','Lucy','lucy','Smith','1993-02-14','Irish','3 Talbot Street, Dublin 1','Dublin','Ireland','01567567','0866432322','lsmith@hotmail.com',1),('IT6539254','Barbara','barbara','Gleeson','1981-11-18','Irish','56 Edenmore Road, Edenmore, Dublin 15','Dublin','Ireland','01674332','0892534625','bgleeson@hotmail.com',1),('IT6539255','Rahmath','rahmath','Mj','1984-05-20','Indian','5 Main Street','Chennai','India','4543543','085473654','raj@gmail.com',1);

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `Subject` varchar(20) DEFAULT NULL,
  `Day` varchar(10) DEFAULT NULL,
  `Room` varchar(5) DEFAULT NULL,
  `Time` varchar(20) DEFAULT NULL,
  `Sid` varchar(15) DEFAULT NULL,
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DayID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `timetable` */

insert  into `timetable`(`Subject`,`Day`,`Room`,`Time`,`Sid`,`ID`,`DayID`) values ('JSP','Monday','101','09:00 - 11:00','IT6539249',1,1),('EL','Monday','102','11:00 - 12:00','IT6539249',2,1),('EL','Monday','102','14:00 - 16:00','IT6539250',3,1),('CSS','Monday','106','16:00 - 17:00','IT6539250',4,1),('HTML','Tuesday','106','10:00 - 13:00','IT6539250',5,2),('JDBC','Tuesday','107','14:00 - 15:30','IT6539250',6,2),('CSS','Monday','106','12:00 - 13:00','IT6539249',7,1),('HTML','Tuesday','106','09:00 - 11:00','IT6539249',10,2),('JSP','Tuesday','101','11:00 - 13:00','IT6539249',11,2),('CSS','Tuesday','106','14:00 - 15:00','IT6539249',12,2),('HTML','Tuesday','106','15:00 - 17:00','IT6539249',13,2),('JSP','Wednesday','101','09:00 - 11:00','IT6539249',14,3),('Servlets','Wednesday','103','11:00 - 13:00','IT6539249',15,3),('EL','Wednesday','102','14:00 - 17:00','IT6539249',16,3),('Servlets','Thursday','103','09:00 - 11:00','IT6539249',17,4),('HTML','Thursday','106','14:00 - 15:00','IT6539249',19,4),('CSS','Thursday','106','15:00 - 16:00','IT6539249',20,4),('Servlets','Thursday','103','16:00 - 17:00','IT6539249',21,4),('JSP','Monday','101','09:00 - 11:00','IT6539250',23,1),('EL','Monday','102','14:00 - 16:00','IT6539250',24,1),('EL','Monday','102','14:00 - 16:00','IT6539250',25,1),('CSS','Monday','106','16:00 - 17:00','IT6539250',26,1),('HTML','Tuesday','106','10:00 - 13:00','IT6539250',27,2),('JDBC','Tuesday','107','14:00 - 15:30','IT6539250',28,2),('JSP','Tuesday','101','15:30 - 17:00','IT6539250',29,2),('Servlets','Thursday','103','09-00 - 11:00','IT6539250',30,4),('JSP','Tuesday','101','15:30 - 17:00','IT6539250',31,2),('HTML','Wednesday','106','14:00 - 15:30','IT6539250',32,3),('CSS','Wednesday','106','15:30 - 17:00','IT6539250',33,3),('Servlets','Thursday','103','09-00 - 11:00','IT6539250',34,4),('EL','Thursday','102','11:00 - 13:00','IT6539250',35,4),('JSP','Tuesday','101','15:30 - 17:00','IT6539250',36,2),('JDBC','Thursday','108','15:00 - 16:00','IT6539250',37,4),('HTML','Wednesday','106','14:00 - 15:30','IT6539250',38,3),('HTML','Friday','106','09:00 - 10:00','IT6539250',39,5),('CSS','Friday','106','10:00 - 11:00','IT6539250',40,5),('EL','Friday','102','11:00 - 12:00','IT6539250',41,5),('Servlets','Friday','103','12:00 - 13:00','IT6539250',42,5),('JSP','Friday','101','14:00 - 15:30','IT6539250',43,5),('JDBC','Friday','108','15:30 - 17:00','IT6539250',44,5),('Accounting - Man/Com','Monday','114','09:00 - 11:00','AC5667532',45,1),('Bussiness Admin','Monday','118','11:00 - 13:00','AC5667532',46,1),('Marketing Practice','Monday','120','14:00 - 15:30','AC5667532',47,1),('Statistics','Monday','111','15:30 - 17:00','AC5667532',48,1),('Business Law','Tuesday','115','09:00 - 13:00','AC5667532',49,2),('Applied Economics','Tuesday','121','14:00 - 17:00','AC5667532',50,2),('Marketing Practice','Wednesday','120','11:00 - 13:00','AC5667532',51,3),('Marketing Practice','Wednesday','120','11:00 - 13:00','AC5667532',52,3),('Statistics','Wednesday','111','13:00 - 17:00','AC5667532',53,3),('Accounting - Man/Com','Thursday','114','09:00 - 11:00','AC5667532',54,4),('Marketing Practice','Thursday','120','11:00 - 13:00','AC5667532',55,4),('Business Admin','Thursday','119','14:00 - 15:30','AC5667532',56,4),('Statistics','Thursday','111','15:30 - 17:00','AC5667532',57,4),('Accounting - Man/Com','Friday','114','10:00 - 13:00','AC5667532',58,5),('Business Law','Friday','115','14:00 - 17:00','AC5667532',59,5),('JSP','Friday','101','09 :00 - 11:00','IT6539249',60,5),('Business Admin','Monday','304','09:00 - 11:00','AC5667533',61,1),('EL','Monday','102','15:00 - 17:00','IT6539249',62,1),('JDBC','Thursday','108','11:00 - 13:00','IT6539249',64,4),('JDBC','Monday','105','14:00 - 15:00','IT6539249',65,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
