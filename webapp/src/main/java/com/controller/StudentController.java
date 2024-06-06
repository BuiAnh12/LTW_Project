package com.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.StudentDTO;
import com.entity.Student;
import com.service.StudentService;


@Controller
public class StudentController {

	@Autowired
    private StudentService studentService;
	
	
	@GetMapping("/student/insert")
	public String getStudentPage(ModelMap model) {
		StudentDTO student = new StudentDTO();

        model.addAttribute("student", student);
	    return "student/insert/insertStudent";
	}
	
	@RequestMapping(value = "/student/insert", method = RequestMethod.POST)
    public String saveStudent(@ModelAttribute("student") StudentDTO student, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            System.out.println("Received error");
            for (ObjectError error : result.getAllErrors()) {
                if (error instanceof FieldError) {
                    FieldError fieldError = (FieldError) error;
                    System.out.println("Field error: " + fieldError.getField() + " - " + fieldError.getDefaultMessage());
                } else {
                    System.out.println("Object error: " + error.getObjectName() + " - " + error.getDefaultMessage());
                }
            }
            return "student/insert";
        }
        studentService.insertStudent(student);

        return "redirect:/category/student";
    }
	@GetMapping("/student/detail/{id}")
    public String getStudentDetail(@PathVariable("id") Long id, ModelMap model) {
        StudentDTO student = studentService.getStudentById(id);
        model.addAttribute("student", student);
        return "student/detail/detailStudent";
    }
	
	@PostMapping("/student/update")
	public String updateStudent(@RequestParam("id") Long id,@ModelAttribute("student") StudentDTO Updatestudent, ModelMap model) {
	    try {
	        studentService.updateStudentById(id,Updatestudent);
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Error deleting student: " + e.getMessage());
	        System.out.println("ERROR");
	        return "student/detail/detailStudent"; 
	    }
	    return "redirect:/category/student";
	}
	
	@PostMapping("/student/delete")
	public String deleteStudent(@RequestParam("id") Long id, ModelMap model) {
	    try {
	        studentService.deleteStudentById(id);
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Error deleting student: " + e.getMessage());
	        return "student/detail/detailStudent"; 
	    }
	    return "redirect:/category/student";
	}
}
