
use seas_app;
create table seasapp_school_t(
SchoolTitle varchar(255) NOT NULL,
SchoolName varchar(255) NOT NULL,
 PRIMARY KEY(SchoolTitle)
);

create table seasapp_department_t(
DeptID varchar(255) NOT NULL,
DeptName varchar(255) NOT NULL,
SchoolTitle varchar(255) NOT NULL,
 PRIMARY KEY(DeptID),
  FOREIGN KEY (SchoolTitle) REFERENCES seasapp_school_t(SchoolTitle)
);

create table seasapp_faculty_t(
FacultyID INT NOT NULL,
FacultyName varchar(255) NOT NULL,
DeptID varchar(255) NOT NULL,
 PRIMARY KEY(FacultyID),
  FOREIGN KEY (DeptID) REFERENCES seasapp_department_t(DeptID)
);
create table seasapp_course_t(
CourseID varchar(255) NOT NULL,
CourseName varchar(255) NOT NULL,
CreditHour INT  NOT NULL,
DeptID varchar(255) NOT NULL,
 PRIMARY KEY(CourseID),
  FOREIGN KEY (DeptID) REFERENCES seasapp_department_t(DeptID)
);

create table seasapp_coofferedcourse_t(
CourseID varchar(255) NOT NULL,
CoOfferdCourseID varchar(255) NOT NULL,
 PRIMARY KEY(CourseID,CoOfferdCourseID),
  FOREIGN KEY (CourseID) REFERENCES seasapp_course_t(CourseID),
   FOREIGN KEY (CoOfferdCourseID) REFERENCES seasapp_course_t(CourseID)
  
);
create table seasapp_section_t(
SectionNum INT  NOT NULL,
Semester varchar(255) NOT NULL,
Year YEAR NOT NULL,
CourseID varchar(255) NOT NULL,
FacultyID INT NOT NULL,
SectionCapacity INT NOT NULL,
SectionEnrolled INT NOT NULL,
StartTime TIME ,
Endtime TIME,
Day varchar(255),
RoomID varchar(255),
Blocked varchar(255),

 PRIMARY KEY(SectionNum,Semester,Year,CourseID),
  FOREIGN KEY (CourseID) REFERENCES seasapp_course_t(CourseID),
  FOREIGN KEY (FacultyID) REFERENCES seasapp_faculty_t(FacultyID)
  
);

create table seasapp_room_t(
RoomID varchar(255) NOT NULL,
RoomCapacity INT NOT NULL,
 PRIMARY KEY(RoomID)
);





