package com.entity;

import javax.persistence.*;
import lombok.*;
import java.sql.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "lastname")
    private String lastname;

    @Column(name = "firstname")
    private String firstname;
    
    @Column(name = "midlename")
    private String midlename;
    
    @Column(name = "birthdate")
    private String birthdate;
    
    @Column(name = "age")
    private int age;
    
    @Column(name = "gender")
    private String gender;

    @Column(name = "parent_name")
    private String parentName;

    @Column(name = "parent_tel")
    private String parentTel;

    @Column(name = "email")
    private String email;
    
    @Column(name = "login")
    private String login;

    @Column(name = "password")
    private String password;

    @Column(name = "skype")
    private String skype;

    @Column(name = "laptop_available")
    private boolean laptopAvailable;

    @Column(name = "location")
    private String location;
    
    @Column(name = "additional_info")
    private String additionalInfo;
    
    
    public void updateFrom(Student updatedStudent) {
        this.lastname = updatedStudent.getLastname();
        this.firstname = updatedStudent.getFistname();
        this.midlename = updatedStudent.getMidlename();
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
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFistname() {
		return firstname;
	}

	public void setFistname(String firstname) {
		this.firstname = firstname;
	}

	public String getMidlename() {
		return midlename;
	}

	public void setMidlename(String midlename) {
		this.midlename = midlename;
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