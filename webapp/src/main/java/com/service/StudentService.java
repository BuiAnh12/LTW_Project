package com.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dto.ScheduleDTO;
import com.dto.StudentDTO;
import com.entity.Student;
import com.model.StudentTable;
import com.model.StudentTableProjection;
import com.repository.StudentRepo;



@Service
public class StudentService {
    @Autowired
    private StudentRepo studentRepository;
    
    @Transactional
    public List<StudentDTO> listAll() {
        List<Student> entityList = studentRepository.findAll();
        List<StudentDTO> dtoList = new ArrayList<>();
        for (Student student : entityList) {
            StudentDTO tmp = new StudentDTO();
            dtoList.add(tmp.convert(student));
        }
        return dtoList;
    }

    
    @Transactional
    public void insertStudent(StudentDTO student) {
    	Student result = new Student(); 
    	result.convert(student);
        studentRepository.save(result);
    }
    
    @Transactional
    public StudentDTO getStudentById(Long id) {
        Student student = studentRepository.findOne(id);
        StudentDTO result = new StudentDTO();
//        System.out.println("Find: " + student.toString());
        return result.convert(student);
    }
    
    
    @Transactional
    public void deleteStudentById(Long id) {
        studentRepository.delete(id);
    }
    
    
    @Transactional
    public void updateStudentById(Long id, StudentDTO updatedStudent) {
        Student existingStudent = studentRepository.findOne(id);
        if (existingStudent != null) {
        	existingStudent.convert(updatedStudent);
            studentRepository.save(existingStudent);
        }
    }
    
    public List<StudentTable> getStudentTables(String firstName, String age, String groupTitle, String description,
            String teacherName, String courseName) {
		List<Object[]> students = studentRepository.getStudentDetails();
		List<StudentTable> studentTables = new ArrayList<>();
		
		for (Object[] studentData : students) {
			StudentTable studentTable = StudentTable.builder()
			.firstName(studentData[0] != null ? studentData[0].toString() : "")
			.id(studentData[1] != null ? Integer.valueOf(studentData[1].toString()) : 0)
			.age(studentData[2] != null ? Integer.valueOf(studentData[2].toString()) : 0)
			.groupTitle(studentData[3] != null ? studentData[3].toString() : "")
			.groupId(studentData[4] != null ? Integer.valueOf(studentData[4].toString()) : 0)
			.description(studentData[5] != null ? studentData[5].toString() : "")
			.teacherName(studentData[6] != null ? studentData[6].toString() : "")
			.teacherId(studentData[7] != null ? Integer.valueOf(studentData[7].toString()) : 0)
			.courseName(studentData[8] != null ? studentData[8].toString() : "")
			.courseId(studentData[9] != null ? Long.valueOf(studentData[9].toString()) : 0)
			.build();
			studentTables.add(studentTable);
		}
		
		List<StudentTable> filteredResult = new ArrayList<>();
		
		for (StudentTable filterDto : studentTables) {
			if (!isNullOrEmpty(firstName) && !filterDto.getFirstName().toLowerCase().contains(firstName.toLowerCase())) {
			System.out.println("Trigger1");
			continue;
			}
			if (!isNullOrEmpty(courseName) && !filterDto.getCourseName().toLowerCase().contains(courseName.toLowerCase())) {
			System.out.println("Trigger2");
			continue;
			}
			if (!isNullOrEmpty(groupTitle) && !filterDto.getGroupTitle().toLowerCase().contains(groupTitle.toLowerCase())) {
			System.out.println("Trigger3");
			continue;
			}
			if (!isNullOrEmpty(teacherName) && !filterDto.getTeacherName().toLowerCase().contains(teacherName.toLowerCase())) {
			System.out.println("Trigger4");
			continue;
			}
			if (!isNullOrEmpty(age) && !filterDto.getAge().equals(Integer.valueOf(age))) {
			System.out.println("Trigger5");
			continue;
			}
			if (!isNullOrEmpty(description) && !filterDto.getDescription().toLowerCase().contains(description.toLowerCase())) {
			System.out.println("Trigger6");
			continue;
			}
			filteredResult.add(filterDto);
		}
		
		return filteredResult;  // Return the filtered result
	}

	private boolean isNullOrEmpty(String str) {
		return str == null || str.isEmpty();
	}


}
