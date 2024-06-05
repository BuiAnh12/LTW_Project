<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                            rel="stylesheet" />
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
                        <style>
                            <%@include file="/WEB-INF/views/student/insert/style.css" %>
                        </style>
                        <base href="${pageContext.servletContext.contextPath}/">
                        <title>Create Student</title>
                    </head>

                    <body>
                        <div class="d-flex" id="wrapper">
                            <!-- Sidebar -->
                            <div class="bg-white" id="sidebar-wrapper">
                                <div
                                    class="sidebar-heading text-center py-4 primary-text fs-5 fw-bold text-uppercase border-bottom">
                                    <i class="fas fa-user-secret me-2"></i>CodeXpert
                                </div>
                                <div class="list-group list-group-flush my-3">
                                    <a href="index.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
                                    <a href="schedule.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-project-diagram me-2"></i>Schedue</a>
                                    <a href="group.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-chart-line me-2"></i>Group</a>
                                    <a href="student.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-paperclip me-2"></i>Student</a>
                                    <a href="course.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-shopping-cart me-2"></i>Course</a>
                                    <a href="employees.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-gift me-2"></i>Employees</a>
                                    <a href="venues.html"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-map-marker-alt me-2"></i>Venues</a>
                                    <a href="#"
                                        class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                                            class="fas fa-comment-dots me-2"></i>Extra</a>
                                    <a href="#"
                                        class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                                            class="fas fa-power-off me-2"></i>Logout</a>
                                </div>
                            </div>
                            <!-- /#sidebar-wrapper -->

                            <!-- Page Content -->
                            <!-- Top nav Content -->
                            <div id="page-content-wrapper">
                                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                                        <h2 class="fs-2 m-0">Add student</h2>
                                        <c:if test="${not empty errorMessage}">
										    <div class="alert alert-danger">${errorMessage}</div>
										</c:if>
                                    </div>

                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>

                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle second-text fw-bold" href="#"
                                                    id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i class="fas fa-user me-2"></i>John Doe
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                    <li><a class="dropdown-item" href="#">Profile</a></li>
                                                    <li><a class="dropdown-item" href="#">Settings</a></li>
                                                    <li><a class="dropdown-item" href="#">Logout</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                                <div class="container">
                                    <div class="detail_container">
                                        <div class="col">
                                            <form:form action="/webapp/student/update?id=${student.id}" method="post"
                                                modelAttribute="student">
                                                <form:input
                                                type="id"
                                                 path="id"
                                                 id="last-name"
                                               class="form-control"/>
                                                <div class="row">
                                                    <div class="col-9">
                                                        <div class="floating-block main-info">
                                                            <div class="wrapper">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="row">
                                                                            <div class="divider" style="height: 30px;">
                                                                            </div>
                                                                            <span class="h3">Student</span>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- First Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label for="last-name">Last
                                                                                                name:</label>
                                                                                            <form:input
                                                                                                path="lastname"
                                                                                                id="last-name"
                                                                                                class="form-control"/>
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            <label
                                                                                                for="first-name">First
                                                                                                name*:</label>
                                                                                            <form:input
                                                                                                path="firstname"
                                                                                                id="first-name"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            <label
                                                                                                for="middle-name">Middle
                                                                                                name:</label>
                                                                                            <form:input
                                                                                                path="midelname"
                                                                                                id="middle-name"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- Second Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-3">
                                                                                            <label for="dob">Date of
                                                                                                Birth:</label>
                                                                                            <form:input
                                                                                                path="birthdate"
                                                                                                id="dob" type="date"
                                                                                                class="form-control"
                                                                                                placeholder="__/__/____" />
                                                                                                <form:errors path="birthdate" cssClass="error"/>
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            <label
                                                                                                for="age">Age:</label>
                                                                                            <form:input
                                                                                                path="age"
                                                                                                id="age"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                        <div class="col-md-4">
                                                                                            <label
                                                                                                for="gender">Gender:</label>
                                                                                            <form:input
                                                                                                path="gender"
                                                                                                id="gender"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="divider" style="height: 45px;">
                                                                        </div>
                                                                        <div class="row">
                                                                            <span class="h3">Parent</span>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- First Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="parent-name">Parent
                                                                                                name:</label>
                                                                                            <form:input
                                                                                                path="parentName"
                                                                                                id="parent-name"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- Second Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="parent-tel">Parent
                                                                                                tel.:</label>
                                                                                            <form:input
                                                                                                path="parentTel"
                                                                                                id="parent-tel"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="parent-email">Email:</label>
                                                                                            <form:input
                                                                                                path="email"
                                                                                                id="parent-email"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <!-- Second Column -->
                                                                        <div class="divider" style="height: 30px;">
                                                                        </div>
                                                                        <div class="row">
                                                                            <span class="h3">Additional
                                                                                Information</span>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- First Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="login">Login:</label>
                                                                                            <form:input
                                                                                                path="login"
                                                                                                id="login"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="password">Password:</label>
                                                                                            <form:input
                                                                                                path="password"
                                                                                                id="password"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label
                                                                                                for="skype">Skype:</label>
                                                                                            <form:input
                                                                                                path="skype"
                                                                                                id="skype"
                                                                                                class="form-control" />
                                                                                        </div>
                                                                                        <div class="col-md-4">
                                                                                            <label
                                                                                                for="student-has_laptop">Laptop:</label>
                                                                                            <form:select
                                                                                                path="laptopAvailable"
                                                                                                id="student-has_laptop"
                                                                                                class="form-control">
                                                                                                <form:option
                                                                                                    value="true"
                                                                                                    label="Yes" />
                                                                                                <form:option
                                                                                                    value="false"
                                                                                                    label="No" />
                                                                                            </form:select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <label
                                                                                        for="location">Location:</label>
                                                                                    <form:input path="location"
                                                                                        id="location"
                                                                                        class="form-control" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <label for="student-info">Additional
                                                                                        Information:</label>
                                                                                    <form:textarea
                                                                                        path="additionalInfo"
                                                                                        id="student-info"
                                                                                        class="form-control" rows="4" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-3">
                                                         <div class="row">
						                                    <div class="side-floating-block button-side">
						                                        <div class="btn-group">
						                                            <form:form action="/webapp/student/update?id=${student.id}" method="post" modelAttribute="student">
																    <!-- Your form fields here -->
																		<form:button type="submit" class="btn-add btn-primary">Save</form:button>
																	</form:form>
																	<form:form action="/webapp/student/delete?id=${student.id}" method="post" modelAttribute="student">
																    <!-- Your form fields here -->
																		<form:button type="submit" class="btn-danger btn-secondary">Delete</form:button>
																	</form:form>
						                                            
						                                        </div>
						                                    </div>
						                                </div>
							                                <div class="divider" style="height: 20px;"></div>                                   
							                                <div class="row">
							                                    <div class="side-floating-block" style="justify-content:left;">
							                                        <label for="createby" style="font-size: 13px; justify-content:left;">Create by: </label> 
							                                        <span class="span-text">Tom Bui</span>
							                                        <label for="createwhen" style="font-size: 13px; justify-content:left;">Create when: </label> 
							                                        <span class="span-text">12-04-2023</span>
							                                    </div>
							
							                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                            <div class="divider" style="height: 30px;"></div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="full-floating-block">
                                                        <div class="wrapper">
                                                            <div class="col">
                                                                <div class="row selected_class">
                                                                    <div class="divider" style="height: 30px;"></div>
                                                                    <h3>Selected class</h3>
                                                                    <div class="col">
                                                                        <table
                                                                            class="table bg-white rounded shadow-sm table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th scope="col"
                                                                                        style="width: 250px;">Title</th>
                                                                                    <th scope="col">Venue</th>
                                                                                    <th scope="col">Students</th>
                                                                                    <th scope="col"
                                                                                        style="width: 150px;">Lesson
                                                                                        time</th>
                                                                                    <th scope="col">Next lesson</th>
                                                                                    <th scope="col">Teacher</th>
                                                                                    <th scope="col">Supervisor</th>
                                                                                    <th scope="col">Course</th>
                                                                                    <th scope="col">Format</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="selected-class-table">
                                                                            </tbody>
                                                                        </table>
                                                                    </div>

                                                                </div>
                                                                <div class="row selected_menu">
                                                                    <div class="divider" style="height: 30px;"></div>
                                                                    <h3>Class table</h3>
                                                                    <div class="btn-group">
                                                                        <button class="btn-select btn-primary"
                                                                            id="cancelSelectionBtn">Cancel
                                                                            selection</button>
                                                                    </div>
                                                                    <div class="col">
                                                                        <table
                                                                            class="table bg-white rounded shadow-sm  table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th scope="col"
                                                                                        style="width: 50px;"></th>
                                                                                    <!-- New column for selection -->
                                                                                    <th scope="col"
                                                                                        style="width: 250px;">Title</th>
                                                                                    <th scope="col">Venue</th>
                                                                                    <th scope="col">Students</th>
                                                                                    <th scope="col"
                                                                                        style="width: 150px;">Lesson
                                                                                        time</th>
                                                                                    <th scope="col">Next lesson</th>
                                                                                    <th scope="col">Teacher</th>
                                                                                    <th scope="col">Supervisor</th>
                                                                                    <th scope="col">Course</th>
                                                                                    <th scope="col">Format</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr class="selectable-row">
                                                                                    <td><input type="radio"
                                                                                            name="selectRow"></td>
                                                                                    <!-- Selection box -->
                                                                                    <td><small
                                                                                            class="small-text">NVH_GD65_MON_OFF
                                                                                            3:00 PM - 4:30 PMPreferred
                                                                                            Language: ENG</small></td>
                                                                                    <td><small
                                                                                            class="small-text">Home</small>
                                                                                    </td>
                                                                                    <td><small
                                                                                            class="small-text">4</small>
                                                                                    </td>
                                                                                    <td><small class="small-text">3:00
                                                                                            PM - 4:30</small></td>
                                                                                    <td><small
                                                                                            class="small-text"></small>Adding
                                                                                        riddles and puzzles to the quest
                                                                                        ENG GD M2L4</td>
                                                                                    <td><small
                                                                                            class="small-text">Tom</small>
                                                                                    </td>
                                                                                    <td><small
                                                                                            class="small-text">Finn</small>
                                                                                    </td>
                                                                                    <td><small class="small-text">Game
                                                                                            Development</small></td>
                                                                                    <td><small
                                                                                            class="btn-sm btn-primary"
                                                                                            aria-disabled="true">Offline</small>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr class="selectable-row">
                                                                                    <td><input type="radio"
                                                                                            name="selectRow"></td>
                                                                                    <!-- Selection box -->
                                                                                    <td><small
                                                                                            class="small-text">NVH_GD66_MON_OFF
                                                                                            3:00 PM - 4:30 PMPreferred
                                                                                            Language: ENG</small></td>
                                                                                    <td><small
                                                                                            class="small-text">Home</small>
                                                                                    </td>
                                                                                    <td><small
                                                                                            class="small-text">4</small>
                                                                                    </td>
                                                                                    <td><small class="small-text">3:00
                                                                                            PM - 4:30</small></td>
                                                                                    <td><small
                                                                                            class="small-text"></small>Adding
                                                                                        riddles and puzzles to the quest
                                                                                        ENG GD M2L4</td>
                                                                                    <td><small
                                                                                            class="small-text">Tom</small>
                                                                                    </td>
                                                                                    <td><small
                                                                                            class="small-text">Finn</small>
                                                                                    </td>
                                                                                    <td><small class="small-text">Game
                                                                                            Development</small></td>
                                                                                    <td><small
                                                                                            class="btn-sm btn-primary"
                                                                                            aria-disabled="true">Offline</small>
                                                                                    </td>
                                                                                </tr>
                                                                                <!-- Add more rows as needed -->
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!-- /#page-content-wrapper -->
                        </div>

                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
                        <script>
                            var el = document.getElementById("wrapper");
                            var toggleButton = document.getElementById("menu-toggle");

                            toggleButton.onclick = function () {
                                el.classList.toggle("toggled");
                            };
                        </script>
                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const radioButtons = document.querySelectorAll('input[name="selectRow"]');
                                const selectedClassTable = document.getElementById('selected-class-table');
                                const cancelSelectionBtn = document.getElementById('cancelSelectionBtn');

                                radioButtons.forEach(button => {
                                    button.addEventListener('change', function () {
                                        updateSelectedClassTable();
                                    });
                                });

                                cancelSelectionBtn.addEventListener('click', function () {
                                    // Clear the content of the upper table
                                    selectedClassTable.innerHTML = '';
                                });

                                function updateSelectedClassTable() {
                                    // Remove existing content from the upper table
                                    selectedClassTable.innerHTML = '';

                                    // Get the selected radio button
                                    const selectedButton = document.querySelector('input[name="selectRow"]:checked');

                                    // If a radio button is selected, clone the corresponding row and append it to the upper table
                                    if (selectedButton) {
                                        const selectedRow = selectedButton.closest('tr').cloneNode(true);
                                        // Remove the checkbox and its parent td from the cloned row
                                        selectedRow.removeChild(selectedRow.querySelector('td'));
                                        selectedClassTable.appendChild(selectedRow);

                                        // Check the corresponding radio button in the lower table
                                        selectedButton.checked = true;
                                    }
                                }
                            });
                        </script>
                    </body>

                    </html>