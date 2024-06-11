package com.service;
import org.springframework.data.domain.Pageable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dto.ScheduleDTO;
import com.dto.StudentDTO;
import com.entity.Student;
import com.model.StudentTable;
import com.model.StudentTableProjection;
import com.repository.StudentRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;


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
    public Student insertStudent(StudentDTO student) {
    	Student result = new Student(); 
    	result.convert(student);
        Student reStudent = studentRepository.save(result);
        System.out.println("Save studentID" + reStudent.getId());
        return reStudent;
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
    
    public Long getRegistrationGroup(Long studentId) {
    	Long groupId = studentRepository.findRegistration(studentId);
    	return groupId;
    }
    
    public Page<StudentTable> getStudentTables(String firstName, String age, String groupTitle, String description,
            String teacherName, String courseName, Pageable pageable) {
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
		continue;
		}
		if (!isNullOrEmpty(courseName) && !filterDto.getCourseName().toLowerCase().contains(courseName.toLowerCase())) {
		continue;
		}
		if (!isNullOrEmpty(groupTitle) && !filterDto.getGroupTitle().toLowerCase().contains(groupTitle.toLowerCase())) {
		continue;
		}
		if (!isNullOrEmpty(teacherName) && !filterDto.getTeacherName().toLowerCase().contains(teacherName.toLowerCase())) {
		continue;
		}
		if (!isNullOrEmpty(age) && !filterDto.getAge().equals(Integer.valueOf(age))) {
		continue;
		}
		if (!isNullOrEmpty(description) && !filterDto.getDescription().toLowerCase().contains(description.toLowerCase())) {
		continue;
		}
		filteredResult.add(filterDto);
		}
		
		// Calculate the start and end indices for the current page
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), filteredResult.size());
		List<StudentTable> pagedResult = filteredResult.subList(start, end);
		
		// Create a Page object for the filtered and paged results
		return new PageImpl<>(pagedResult, pageable, filteredResult.size());
	}

	private boolean isNullOrEmpty(String str) {
		return str == null || str.isEmpty();
	}


}
