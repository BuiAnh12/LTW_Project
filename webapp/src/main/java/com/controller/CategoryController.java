package com.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dto.StudentDTO;
import com.entity.Student;
import com.service.StudentService;
import com.service.CategoryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CategoryController {
	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	@Autowired
    private StudentService studentService = new StudentService();
	
//	@GetMapping("/student")
//    public String getStudentPage(ModelMap model) {
//        List<Student> students = studentService.listAll();
//        logger.info("Retrieved {} students", students.size()); // Log the number of students retrieved
//        logger.debug("Students: {}", students); // Log the list of students (debug level)
//        
////        ModelAndView view = new ModelAndView("");
//        model.addAttribute("students", students);
//        return "student/student";
//    }
	
	@GetMapping("/student")
	public String getStudentPage(ModelMap model) {

	    // Retrieve the list of all students
	    List<StudentDTO> students = studentService.listAll();
	    
	    // Add students to the model
	    model.addAttribute("students", students);
	    return "student/student";
	}
}
