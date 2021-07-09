/*a.List name of all the courses handled by each trainer*/
SELECT distinct TrainerName,  c.coursename
from trainer t
left join feedback f
on t.TrainerID = f.TrainerID
left join course_details c
on f.CourseID= c.courseId ;

/*b.List the name of trainers who have handled more than one course*/
select TrainerName ,count(f.courseid) as coursesTeach
 from trainer t
right join feedback f 
on t.trainerID= f.TrainerID group by f.TrainerID 
 having coursesTeach>1;
 
/*c.List the trainer id, name of the trainers and number of differnt courses handled*/
select t.trainerId, t.trainerName, count(distinct CourseID) as numberOfCoursesHandled from trainer t
right join feedback f
on f.trainerid = t.TrainerID group by f.TrainerID;

/*d.List the trainer ID, name of traierns, course names and the number of times each course has been handled<.need to check again>*/
select t.TrainerID, t.trainername, c.courseId,c.coursename, 
count(f.courseid) as eachTImeCourseHandled
 from trainer t
left join feedback f 
on t.trainerid = f.trainerid
 right join course_details c 
on f.courseid =c.courseId group by c.courseId ;

/*e.Get the complete training for each batchreview for batch 3 */
select BatchName, sum(timestampdiff(day, b.start_date, b.end_date)) 
as trainingDuaration 
from batch_schedule b
 group by b.batchname;

 /*f.get the course details and trainer details for each batch as on 20 Feb 2007*/
 select c.coursename, c.courseid, t.trainerid, t.trainername, b.BatchName from course_details c 
 left join feedback f on f.CourseID = c.courseId
 left join trainer t on t.trainerId = f.TrainerID
 left join batch_schedule b on f.CourseID = b.CourseID 
 where end_date ='2007-02-20'
 group by b.BatchName;
 
 /*g:List the id of the trainers who have handled more than one course for a batch along with batch name*/
select t.TrainerID, t.TrainerName,b.CourseID, b.BatchName, 
count( b.CourseID) as coursesHandled from trainer t
right join feedback f on t.TrainerID = f.TrainerID 
left join batch_schedule b on b.CourseID = f.CourseID 
group by t.TrainerID;

/*h. list all the trainers (if any) who have handled all the courses present in table*/
select f.TrainerID, t.TrainerName , count(distinct f.CourseID) 
as coursesTeach 
from feedback f
left join trainer t on f.TrainerID = t.TrainerId
group by f.TrainerID 
having   coursesTeach >=11
;