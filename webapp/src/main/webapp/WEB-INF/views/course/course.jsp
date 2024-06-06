<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style><%@include file="/WEB-INF/views/course/style.css"%></style>
    <title>Courses</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-5 fw-bold text-uppercase border-bottom"><i
                    class="fas fa-user-secret me-2"></i>CodeXpert</div>
            <div class="list-group list-group-flush my-3">
                <a href="index.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                    class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="schedule.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-project-diagram me-2"></i>Schedue</a>
                <a href="group.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-chart-line me-2"></i>Group</a>
                <a href="student.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-paperclip me-2"></i>Student</a>
                <a href="course.html" class="list-group-item list-group-item-action bg-transparent second-text active"><i
                        class="fas fa-shopping-cart me-2"></i>Course</a>
                <a href="employees.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-gift me-2"></i>Employees</a>
                <a href="venues.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-map-marker-alt me-2"></i>Venues</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-comment-dots me-2"></i>Extra</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
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
                    <h2 class="fs-2 m-0">Courses</h2>
                </div>
                
                <div>
                    <button class="btn-sm " disabled style="color: transparent; border: none;"></button>
                    <a href="/subpage/add-course" class="btn-sm btn-success">Add Course</a>
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
                <!-- button area -->
                
                <!-- table content  -->
                <div class="row my-2 "> 
                    <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                    <div class="col">
                        <div class="row py-2">
                            <div class="col-9" style="text-align: left;">
                                <span>Showing....</span>
                            </div>
                            <div class="col-3" style="text-align: right;">
                                <span>Records on Page</span>
                                <div class="btn-group">
                                  <button type="button" disabled class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    20
                                  </button>
                                  <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Option 1</a>
                                    <a class="dropdown-item" href="#">Option 2</a>
                                    <a class="dropdown-item" href="#">Option 3</a>
                                  </div>
                                </div> 
                            </div>
                        </div>
					<form action="/manager/course-list-active-btn" method = "POST"> 
					
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Name Course</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Status</th>
                                  
                                </tr>
                                <tr>
            
                                    <th scope="col"> <input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control bg-transparent border-0"  placeholder="" aria-label="Username" aria-describedby="basic-addon1" disabled></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                </tr>
                            </thead>
                            <tbody>
							    <c:forEach items="${courseList}" var="course">
							        <tr>
							            <td><a href="/subpage/details-course?courseId=${course.courseId}">${course.courseName}</a></td>
							            <td>${course.description}</td>
							            <td>${course.status}</td>							            
							        </tr>
							    </c:forEach>
							</tbody>
                        </table>
                    </form>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

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