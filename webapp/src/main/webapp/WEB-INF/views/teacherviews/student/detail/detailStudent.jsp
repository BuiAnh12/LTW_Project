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
					            <%@include file="/WEB-INF/views/teacherpanel.jsp"%>
					        </div>
                            <!-- /#sidebar-wrapper -->

                            <!-- Page Content -->
                            <!-- Top nav Content -->
                            <div id="page-content-wrapper">
                                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                                        <h2 class="fs-2 m-0">Student Information</h2>
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
                                            <form:form id="studentForm" action="/webapp/student/update?id=${student.id}" method="post"
                                                modelAttribute="student">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="floating-block main-info">
                                                            <div class="wrapper">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="row">
                                                                            <div class="divider" style="height: 30px;">
                                                                            </div>
                                                                            <span class="h3" style="font-weight: bold;">Student</span>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <!-- First Row in First Column -->
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <label for="last-name">First
                                                                                                name*:</label>
                                                                                            <form:input
                                                                                                path="firstname"
                                                                                                id="first-name"
                                                                                                class="form-control"/>
                                                                                        </div>
                                                                                        <div class="col-md-3">
                                                                                            <label
                                                                                                for="first-name">Last
                                                                                                name:</label>
                                                                                            <form:input
                                                                                                path="lastname"
                                                                                                id="last-name"
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
                                                                            <span class="h3" style="font-weight: bold;">Additional
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
                                                                                    <label for="student-info" class="fw-bold" >Additional
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
                                            <%--         <div class="col-3">
                                                         <div class="row">
						                                    <div class="side-floating-block button-side">
						                                        <div class="btn-group">
						                                            <form:form action="/webapp/student/update?id=${student.id}&&registrationGroup=${registrationGroup}" method="post" modelAttribute="student">
																    <!-- Your form fields here -->
																    <input type="hidden" name="registrationGroup" value="${registrationGroup}">
																		<form:button type="submit" class="btn-add btn-primary">Save</form:button>
																	</form:form>
																	<form:form action="/webapp/student/delete?id=${student.id}" method="post" modelAttribute="student">
																    <!-- Your form fields here -->
																		<form:button type="submit" class="btn-danger btn-secondary">Delete</form:button>
																	</form:form>
						                                            
						                                        </div>
						                                    </div>
				
                                                    </div>
                                                </div> --%>
                                            
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
                                                                                    <th scope="col">Students</th>
                                                                                    <th scope="col">Teacher</th>
                                                                                    <th scope="col">Supervisor</th>
                                                                                    <th scope="col">Course</th>
                                                                                    <th scope="col">Format</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="selected-class-table">
                                                                           <c:forEach items="${groupList}" var="group">
                                                                           	<c:if test="${group.id == registrationGroup}">
																					<tr>
																						<td><a href="${pageContext.servletContext.contextPath}/teachersubpage/group-detail?groupId=${group.id}"><small class="small-text">${group.title}</small></a></td>
																						<td><small class="small-text">${group.numOfStudent}</small></td>
																						<td><small class="small-text">${group.teacher}</small></td>
																						<td><small class="small-text">${group.supervisor}</small></td>
																						<td><small class="small-text">${group.course}</small></td>
																						<td><small class="btn-sm btn-primary"
																							aria-disabled="true"> <c:choose>
																									<c:when test="${group.format == 'offline'}">Offline</c:when>
																									<c:otherwise>Online</c:otherwise>
																								</c:choose>
																						</small></td>
																					</tr>
																					</c:if>
																				</c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
																</form:form>
                                                                </div>
                                                                <div class="row selected_menu">
                                                                    <div class="divider" style="height: 30px;"></div>
                                                                    <h3>Class table</h3>
                                                                    <div class="btn-group">
                                                                    </div>
                                                                    <div class="col">
                                                                        <table class="table bg-white rounded shadow-sm  table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th scope="col"
                                                                                        style="width: 50px;"></th>
                                                                                    <!-- New column for selection -->
                                                                                    <th scope="col"
                                                                                        style="width: 250px;">Title</th>
                                                                                    <th scope="col">Students</th>
                                                                                    <th scope="col">Teacher</th>
                                                                                    <th scope="col">Supervisor</th>
                                                                                    <th scope="col">Course</th>
                                                                                    <th scope="col">Format</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
																		        <c:forEach items="${groupList}" var="group">
																		            <tr>
																		                <td>
																		                    <input type="radio" name="selectRow" value="${group.id}" <c:if test="${group.id == registrationGroup}">checked</c:if>>
																		                </td>
																		                <td>
																		                    <a href="${pageContext.servletContext.contextPath}/teachersubpage/group-detail?groupId=${group.id}">
																		                        <small class="small-text">${group.title}</small>
																		                    </a>
																		                </td>
																		                <td><small class="small-text">${group.numOfStudent}</small></td>
																		                <td><small class="small-text">${group.teacher}</small></td>
																		                <td><small class="small-text">${group.supervisor}</small></td>
																		                <td><small class="small-text">${group.course}</small></td>
																		                <td>
																		                    <small class="btn-sm btn-primary" aria-disabled="true">
																		                        <c:choose>
																		                            <c:when test="${group.format == 'offline'}">Offline</c:when>
																		                            <c:otherwise>Online</c:otherwise>
																		                        </c:choose>
																		                    </small>
																		                </td>
																		                <!-- Hidden input to pass the groupId in the form -->
										
																		            </tr>
																		        </c:forEach>
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
                                    
                                    // Add the hidden input tag with the groupId of the selected row
                                    const groupId = selectedButton.value;
                                    const hiddenInput = document.createElement('input');
                                    hiddenInput.type = 'hidden';
                                    hiddenInput.name = 'groupId';
                                    hiddenInput.value = groupId;
                                    
                                    selectedRow.appendChild(hiddenInput);
                                    selectedClassTable.appendChild(selectedRow);

                                    // Check the corresponding radio button in the lower table
                                    selectedButton.checked = true;
                                }
                            }
                        });

                        </script>
                         <script>
						    document.getElementById('dob').addEventListener('change', function() {
						        var dob = new Date(this.value);
						        var today = new Date();
						        var age = today.getFullYear() - dob.getFullYear();
						        var m = today.getMonth() - dob.getMonth();
						        if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
						            age--;
						        }
						        document.getElementById('age').value = age;
						    });
						
						    document.getElementById('studentForm').addEventListener('keydown', function(event) {
						        if (event.key === 'Enter' && event.target.nodeName === 'INPUT') {
						            event.preventDefault();
						        }
						    });
						
						    document.getElementById('studentForm').addEventListener('submit', function(event) {
						        var firstName = document.getElementById('first-name').value;
						        var age = document.getElementById('age').value;
						
						        if (!firstName || !age) {
						            event.preventDefault();
						            alert('First name and age fields must be filled.');
						        }
						    });
						</script>
	                        <script>
						    document.getElementById('dob').addEventListener('change', function() {
						        var dob = new Date(this.value);
						        var today = new Date();
						        var age = today.getFullYear() - dob.getFullYear();
						        var m = today.getMonth() - dob.getMonth();
						        if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
						            age--;
						        }
						        document.getElementById('age').value = age;
						    });
						
						    document.getElementById('studentForm').addEventListener('keydown', function(event) {
						        if (event.key === 'Enter' && event.target.nodeName === 'INPUT') {
						            event.preventDefault();
						        }
						    });
						</script>
                    </body>

                    </html>