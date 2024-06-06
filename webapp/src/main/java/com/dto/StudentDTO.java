package com.dto;
import java.util.Date;

import javax.persistence.Column;

import com.entity.Student;

public class StudentDTO{
	private Long id;
	private String lastname;
	private String firstname;
	private String midelname;
	private String birthdate;
	private int age;
	private String gender;
    private String parentName;
    private String parentTel;
    private String email;
    private String login;
    private String password;
    private String skype;
    private boolean laptopAvailable;
    private String location;
    private String additionalInfo;
	
	public StudentDTO convert(Student updatedStudent) {
		this.id = updatedStudent.getId();
        this.lastname = updatedStudent.getLastname();
        this.firstname = updatedStudent.getFistname();
        this.midelname = updatedStudent.getMidlename();
        this.birthdate = updatedStudent.getBirthdate();
        this.age = updatedStudent.getAge();
        this.gender = updatedStudent.getGender();
        this.parentName = updatedStudent.getParentName();
        this.parentTel = updatedStudent.getParentTel();
        this.email = updatedStudent.getEmail();
        this.login = updatedStudent.getLogin();
        this.password = updatedStudent.getPassword();
        this.skype = updatedStudent.getSkype();
        this.laptopAvailable = updatedStudent.isLaptopAvailable();
        this.location = updatedStudent.getLocation();
        this.additionalInfo = updatedStudent.getAdditionalInfo();
        return this;
    }
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getMidelname() {
		return midelname;
	}
	public void setMidelname(String midelname) {
		this.midelname = midelname;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getParentTel() {
		return parentTel;
	}
	public void setParentTel(String parentTel) {
		this.parentTel = parentTel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSkype() {
		return skype;
	}
	public void setSkype(String skype) {
		this.skype = skype;
	}
	public boolean isLaptopAvailable() {
		return laptopAvailable;
	}
	public void setLaptopAvailable(boolean laptopAvailable) {
		this.laptopAvailable = laptopAvailable;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAdditionalInfo() {
		return additionalInfo;
	}
	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}


	
}
