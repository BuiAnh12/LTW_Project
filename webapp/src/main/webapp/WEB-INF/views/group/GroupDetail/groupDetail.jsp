<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <style><%@include file="/WEB-INF/views/group/GroupDetail/style.css"%></style>
  <base href="${pageContext.servletContext.contextPath}/">
    <title>Groups</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div>
        <%@include file="/WEB-INF/views/panel.jsp"%>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
       <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Group Details</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                    <div class="row">
                        <div class="col-12">
							<div class="full-floating-block">
								<form:form action="yourActionURL" method="POST">
									<div class="wrapper">
										<div class="col">
											<div class="divider" style="height: 20px;"></div>
											<div class="col">
												<div class="row selected_class">
													<div class="col-12">
														<div class="row form-container">
															<div class="col-12 form-group">
																<input type="text" id="title" class="form-control"
																	value="${groupObject.title}">
															</div>
															<div class="col-12 form-group">
																<input type="text" id="note" class="form-control"
																	value="${groupObject.note}">
															</div>
														</div>
													</div>
												</div>

												<div class="row form-container">
													<div class="col-md-4 form-group">
														<label for="start-date">Start Date:</label> <input
															type="date" id="start-date" class="form-control"
															value="${groupObject.startDate}">
													</div>
													<div class="col-md-4 form-group">
														<label for="main-teacher">Main Teacher:</label> <select
															id="main-teacher" class="form-control">
															<option value="" disabled>Select Main Teacher</option>
															<option value="${groupObject.teacher}" selected>${groupObject.teacher}</option>
															<c:forEach var="teacher" items="${teacherList}">
																<option value="${teacher.id}">${teacher.name}</option>
															</c:forEach>
														</select>
													</div>

													<div class="col-md-4 form-group">
														<label for="course">Course:</label> <select id="course"
															class="form-control">
															<option value="" selected disabled>Select Course</option>
															<option value="${groupObject.course}" selected>${groupObject.course}</option>
															<c:forEach var="course" items="${courseList}">
																<option value="${course.courseId}">${course.courseName}</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-md-4 form-group">
														<label for="end-date">End Date:</label> <input type="date"
															id="end-date" class="form-control" value="${groupObject.endDate}">
													</div>

													<div class="col-md-4 form-group">
														<label for="supervisor">Supervisor:</label> <select
															id="supervisor" class="form-control">
															<option value="" selected disabled>Select
																Supervisor</option>
															<option value="${groupObject.supervisor}" selected>${groupObject.supervisor}
																</option>
															<c:forEach var="supervisor" items="${supervisorList}">
																<option value="${supervisor.id}">${supervisor.name}</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-md-4 form-group">
														<label for="status">Status:</label> <select id="status"
															class="form-control">
															<option value="" disabled>Status</option>
															<option value="1"
																${groupObject.status == 1 ? 'selected' : ''}>Incoming</option>
															<option value="2"
																${groupObject.status == 2 ? 'selected' : ''}>Started</option>
															<option value="3"
																${groupObject.status == 3 ? 'selected' : ''}>Done</option>
														</select>
													</div>

													<div class="col-md-4 form-group">
														<label for="supervisor"></label>
														<div class="row">
															<div class="col-3">
																<input type="button" class="btn-delete" value="Delete">
															</div>
															<div class="col-3">
																<input type="button" class="btn-update" value="Update">
															</div>
															<div class="col-6"></div>
														</div>
													</div>

												</div>

											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
                    </div>
                    <div class="divider" style="height: 20px;"></div>
                    <div class="d-flex justify-content-end">
                        <input type="button" class="btn-add" style="background-color: rgb(0, 148, 227);"
                            value="Add Student" onclick="openModal()">
                    </div>

                    <!-- The Modal -->
                    <div id="myModal" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <div class="modal-main-content">
                                <h2>Select a Student</h2>
                                <div class="divider" style="height: 20px;"></div>
                                <div class="d-flex justify-content-end">
                                    <button class="btn btn-primary" onclick="submitSelection()">Submit</button>
                                </div>
                                <table class="table bg-white rounded shadow-sm table-hover">
                                    <thead>
                                        <tr>

                                            <th scope="col">First Name</th>
                                            <th scope="col-1">Age</th>
                                            <th scope="col-1"></th>
                                        </tr>
                                        <tr>
                                            <th scope="col">
                                                <input type="text" class="form-control" placeholder=""
                                                    aria-label="first-name" aria-describedby="basic-addon1"
                                                    style="height: 30px;" />
                                            </th>
                                            <th scope="col">
                                                <input type="text" class="form-control" placeholder="" aria-label="age"
                                                    aria-describedby="basic-addon1" style="height: 30px;" />
                                            </th>
                                            <th scope="col">
                                                <!-- Leave this empty as it's just the header for the selection column -->
                                            </th>
                                        </tr>
                                    </thead>
									<tbody>
										<c:forEach var="student" items="${allStudent}">
											<tr data-link="link_to_redirect">
												<td><a href="#"
													style="text-decoration: none; color: rgb(25, 0, 255)">${student.firstname}</a>
												</td>
												<td>${student.age}</td>
												<td class="text-center">
													<!-- Selection column with checkbox --> <input
													type="checkbox" class="center-checkbox">
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="full-floating-block">
                                <form:form action="yourActionURL" method="POST">
                                <div class="wrapper">
                                    <div class="col">
                                        <div class="divider" style="height: 20px;"></div>
                                        <div class="col">
                                            <table class="table bg-white rounded table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Last Name, First Name</th>
                                                        <th scope="col">Age</th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Password</th>
                                                    </tr>
                                                </thead>
													<tbody>
														<c:forEach var="student" items="${studentList}">
															<tr data-link="link_to_redirect">
																<td class="align-middle"><small><a href="#"
																		style="text-decoration: none; color: rgb(0, 191, 255)">
																			${student.fullname} </a></small></td>
																<td class="align-middle"><small>${student.age}</small></td>
																<td class="align-middle"><small>${student.username}</small></td>
																<td class="align-middle">
																	<div class="input-group" style="align-items: center;">
																		<input type="password"
																			class="form-control password-field"
																			style="height: 30px; margin-right: 5px;"
																			aria-label="Password" disabled
																			value="${student.password}">
																		<div class="input-group-append">
																			<button class="btn toggle-password"
																				style="height: 30px; width: 30px; display: flex; align-items: center; justify-content: center;"
																				type="button">
																				<i class="far fa-eye"></i>
																			</button>
																		</div>
																		<div class="input-group-append">
																			<button class="btn-danger delete-btn"
																				style="height: 30px; width: 30px; display: flex; align-items: center; justify-content: center;"
																				type="button">
																				<i class="far fa-trash-alt"></i>
																			</button>
																		</div>
																	</div>
																</td>
															</tr>
														</c:forEach>		
													</tbody>
												</table>

                                        </div>
                                    </div>
                                </div>
                                </form:form>
                            </div>
                        </div>
                        <div class="divider" style="height: 50px;"></div>

                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="full-floating-block">
                             <form:form action="yourActionURL" method="POST">
                                <div class="wrapper">
                                    <div class="row selected_menu">
                                        <div class="divider" style="height: 20px;"></div>
                                        <div class="col">
                                            <table class="table bg-white rounded table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Lesson Name</th>
                                                        <th scope="col">Date</th>
                                                        <th scope="col">Teacher</th>
                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
													<tbody>
														<c:forEach var="lesson" items="${lessonList}"
															varStatus="loop">
															<tr data-link="link_to_redirect">
																<td class="align-middle"><small><a href="#"
																		style="text-decoration: none; color: rgb(0, 191, 255)">${lesson.detail}</a></small>
																</td>
																<td class="align-middle"><input type="date"
																	value="2023-12-12"></td>
																<td class="align-middle"><select id="main-teacher"
																	class="form-control">
																		<option value="" disabled>Select Main Teacher</option>
																		<option value="${groupObject.teacher}" selected>${groupObject.teacher}</option>
																		<c:forEach var="teacher" items="${teacherList}">
																			<option value="${teacher.id}">${teacher.name}</option>
																		</c:forEach>
																</select></td>

																<td class="align-middle">
																	<div class="form-group">
																		<select class="form-control-sm"
																			id="status${loop.index}"
																			onchange="updateBackgroundColor('status${loop.index}')">
																			<option value="open"
																				style="background-color: rgb(84, 190, 84); color: white;">Open</option>
																			<option value="closed"
																				style="background-color: rgb(193, 85, 85); color: white;">Closed</option>
																		</select>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
                                        </div>
                                    </div>
                                </div>
                                </form:form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    <!-- /#page-content-wrapper -->
    </div>
    <script>
        function updateBackgroundColor(selectId) {
            var select = document.getElementById(selectId);
            var selectedOption = select.options[select.selectedIndex];
            select.style.backgroundColor = selectedOption.style.backgroundColor;
            select.style.color = selectedOption.style.color;
            //Gọi controller
        }

        // Initialize background color on page load
        updateBackgroundColor('status1');
        updateBackgroundColor('status2');
    </script>

    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.querySelector(".btn-add");

        // When the user clicks the button, open the modal
        function openModal() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        function closeModal() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                closeModal();
            }
        }

    </script>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function updateBackgroundColor(selectId) {
            var select = document.getElementById(selectId);
            var selectedOption = select.options[select.selectedIndex];
            select.style.backgroundColor = selectedOption.style.backgroundColor;
            select.style.color = selectedOption.style.color;
        }
    </script>
    <script>
        $(document).ready(function () {
            $('.toggle-password').on('click', function () {
                var passwordField = $(this).closest('.input-group').find('.password-field');
                var type = passwordField.attr('type');
                if (type === 'password') {
                    passwordField.attr('type', 'text');
                } else {
                    passwordField.attr('type', 'password');
                }
            });
        });
    </script>
    <script>
        var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
        var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
            return new bootstrap.Dropdown(dropdownToggleEl)
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>