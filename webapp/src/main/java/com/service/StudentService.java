package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Student;
import com.repository.StudentRepo;



@Service
public class StudentService {
    @Autowired
    private StudentRepo studentRepository;
    
    @Transactional
    public List<Student> listAll() {
        return (List<Student>) studentRepository.findAll();
    }
    
    @Transactional
    public void saveStudent(Student student) {
        studentRepository.save(student);
    }
    
    @Transactional
    public Student getStudentById(Integer id) {
        Student student = studentRepository.findOne(id);
        System.out.println("Find: " + student.toString());
        return student;
    }
    
    @Transactional
    public void deleteStudent(Student student) {
    	System.out.println("Delete: " + student.toString());
        studentRepository.delete(student);
    }
    
    @Transactional
    public void deleteStudentById(Integer id) {
        studentRepository.delete(id);
    }
    
    
    @Transactional
    public void updateStudentById(Integer id, Student updatedStudent) {
        Student existingStudent = getStudentById(id);
        if (existingStudent != null) {
        	existingStudent.updateFrom(updatedStudent);
            studentRepository.save(existingStudent);
        }
    }
}
