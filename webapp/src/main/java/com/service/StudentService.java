package com.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dto.StudentDTO;
import com.entity.Student;
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
}
