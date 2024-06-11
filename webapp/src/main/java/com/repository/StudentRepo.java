package com.repository;
import com.model.*;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param;
import com.entity.Student;


@Repository
public interface StudentRepo extends JpaRepository<Student, Long> {
	@Query("select count(re.student.id) from Registration re where re.group.format = 1")
    int numberOnlStudent();
	
	@Query("select count(re.student.id) from Registration re where re.group.format = 0")
    int numberOffStudent();

	@Query(value = "SELECT st.firstname as firstName, st.id as id, st.age as age, g.title as groupTitle, g.id as groupId, " +
	        "c.description as description, u.name as teacherName, u.id as teacherId, " +
	        "c.course_name as courseName, c.course_id as courseId " +
	        "FROM student st " +
	        "LEFT JOIN registration r ON st.id = r.student_id " +
	        "LEFT JOIN `group` g ON g.id = r.group_id " +
	        "LEFT JOIN course c ON c.course_id = g.course_id " +
	        "LEFT JOIN user u ON u.id = g.main_teacher_id ", nativeQuery = true)
	List<Object[]> getStudentDetails();
	
	@Query("select re.group.id from Registration re where re.student.id = ?1")
	Long findRegistration(Long StudentId);
	
	@Query(value = "SELECT * FROM student s LEFT JOIN registration r ON s.id = r.student_id WHERE r.student_id IS NULL", nativeQuery = true)
	List<Student> getForAddingGroup();

}


