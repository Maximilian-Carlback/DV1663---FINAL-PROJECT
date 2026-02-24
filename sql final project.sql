Create database final_project;

show databases;

use final_project;

Create table Members (
Member_ID int not null auto_increment, 
MemberName varchar(50), 
MemberEmail varchar(100),
Fee decimal(10,2),
FavoriteCategory varchar(100),
primary key (Member_ID)
);

create table Equipment (
Equipment_ID int not null auto_increment,
EquipmentName varchar(50),
EquipmentCost decimal(10,2),
primary key (Equipment_ID)
);

Create table Instructors (
Instructor_ID int not null auto_increment, 
InstructorName varchar(50), 
Salary decimal(10,2),
Specialty varchar(50),
HireDate date, 
primary key (Instructor_ID)
);

Create table Classes (
Class_ID int not null auto_increment, 
Date date, 
StartTime time,
EndTime time,
Instructor_ID int not null,
primary key (Class_ID),
foreign key (Instructor_ID) references Instructors(Instructor_ID)
);

Create table ExerciseType (
Exercise_ID int not null auto_increment, 
ExerciseName varchar(50), 
Category varchar(50),
Equipment_ID int not null,
primary key (Exercise_ID),
foreign key (Equipment_ID) references Equipment(Equipment_ID)
);

Create table CustomWorkout (
Workout_ID int not null auto_increment, 
CheckIn time, 
CheckOut time,
Date date,
Member_ID int not null,
primary key (Workout_ID),
foreign key (Member_ID) references Members(Member_ID)
);

Create table WorkoutHasExercise (
Workout_ID int not null,
Exercise_ID int not null,
primary key (Workout_ID, Exercise_ID),
foreign key (Workout_ID) references CustomWorkout(Workout_ID),
foreign key (Exercise_ID) references ExerciseType(Exercise_ID)
);

Create table ClassHasExercise (
Class_ID int not null,
Exercise_ID int not null,
primary key (Class_ID, Exercise_ID),
foreign key (Class_ID) references Classes(Class_ID),
foreign key (Exercise_ID) references ExerciseType(Exercise_ID)
);

create table MemberTakesClass (
Member_ID int not null,
Class_ID int not null,
primary key (Member_ID, Class_ID),
foreign key (Member_ID) references Members(Member_ID),
foreign key (Class_ID) references Classes(Class_ID)
);
