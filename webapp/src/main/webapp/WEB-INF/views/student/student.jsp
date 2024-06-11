<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.utils.securityUtil"%>
<%@ page pageEncoding="utf-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-DI/U+B20M5d4fD2UG+P8BGO35nqYjT9tlxG6t2vIY2CH6azYH2i4MIZhf4oAVvrj" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/core@1.6.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.6.3"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <style><%@include file="/WEB-INF/views/student/style.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Admin Dashboard</title>
</head>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-white" id="sidebar-wrapper">
            <%@include file="/WEB-INF/views/panel.jsp"%>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Students </h2>
                </div>
                <div>
                <button class="btn-sm " disabled style="color: transparent; border: none;"></button>
                     <button class="btn-sm btn-sm btn-success" style="font-weight: bold;" onclick="window.location.href='student/insert.htm'">
                         Add Student
                     </button>
                 </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <span class="nav-link dropdown-toggle second-text fw-bold"  id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-2"></i><%=securityUtil.getPrincipal().getFullName()%>
                            </span>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="subpage/userdetail?userid=<%=securityUtil.getPrincipal().getUserId()%>">Profile</a></li>
                                <li><a class="dropdown-item" href="<c:url value='thoat'/>">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container">
                <!-- table content  -->
                <div class="row my-2">
                    <div class="row my-2">
                        <div class="col-6" style="text-align: left">
                            
                        </div>
                        <div class="col-6" style="text-align: right" id="name">
                            
                        </div>
                    </div>
                </div>

                <div class="col" id = "studentTable">
                    <table class="table bg-white rounded shadow-sm table-hover">
                        <thead>
                            <tr>
                                <th scope="col">First Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Group</th>
                                <th scope="col">Description</th>
                                <th scope="col">Teacher</th>
                                <th scope="col">Course</th>
                            </tr>
                            <tr>
                                <th scope="col">
                                    <input type="text" id="firstName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" id="age" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" id="groupTitle" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" id="description" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" id="teacherName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" id="courseName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                            </tr>
                        </thead>
                        <tbody >
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td><small class="small-text"><a href="${pageContext.request.contextPath}/student/detail/${student.id}">${student.firstName}</a></small></td>
                                    <td><small class="small-text">${student.age}</small></td>
                                    <td><small class="small-text"><a href="${pageContext.request.contextPath}/group/detail?id=${student.groupId}">${student.groupTitle}</a></small></td>
                                    <td><small class="small-text">${student.description}</small></td>
                                    <td><small class="small-text"><a href="${pageContext.request.contextPath}/user/detail?id=${student.teacherId}">${student.teacherName}</a></small></td>
                                    <td><small class="small-text"><a href="${pageContext.servletContext.contextPath}/subpage/details-course?courseId=${student.courseId}">${student.courseName}</a></small></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="table-footer">
                    <c:set var="prefixUrl" value="${pageContext.servletContext.contextPath}/category/student?page=" scope="page" />
						<div class="d-flex justify-content-center align-items-center w-100">
						    <span class="interact-page-btn">
						        <c:choose>
						            <c:when test="${currentPage > 1}">
						                <a href="${prefixUrl}${currentPage - 1}">
						                    <i class="fa-solid fa-angle-left"></i>
						                </a>
						            </c:when>
						            <c:otherwise>
						                <a>
						                    <i class="fa-solid fa-angle-left"></i>
						                </a>
						            </c:otherwise>
						        </c:choose>
						    </span>
						    <div id="pages-content" class="d-flex">
						        <c:if test="${currentPage > 1}">
						            <span class="index-btn">
						                <a href="${prefixUrl}${currentPage - 1}">${currentPage - 1}</a>
						            </span>
						        </c:if>
						        <span class="index-btn">
						            <a href="${prefixUrl}${currentPage}">${currentPage}</a>
						        </span>
						        <c:if test="${currentPage < totalPages}">
						            <span class="index-btn">
						                <a href="${prefixUrl}${currentPage + 1}">${currentPage + 1}</a>
						            </span>
						        </c:if>
						    </div>
						    <span class="interact-page-btn">
						        <c:choose>
						            <c:when test="${currentPage < totalPages}">
						                <a href="${prefixUrl}${currentPage + 1}">
						                    <i class="fa-solid fa-angle-right"></i>
						                </a>
						            </c:when>
						            <c:otherwise>
						                <a>
						                    <i class="fa-solid fa-angle-right"></i>
						                </a>
						            </c:otherwise>
						        </c:choose>
						    </span>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        function search() {
            $.ajax({
                url: '${pageContext.servletContext.contextPath}/category/student.htm',
                type: 'GET',
                data: {
                    firstName: $('#firstName').val(),
                    age: $('#age').val(),
                    groupTitle: $('#groupTitle').val(),
                    description: $('#description').val(),
                    teacherName: $('#teacherName').val(),
                    courseName: $('#courseName').val()
                },
                success: function(response) {
                    $('#studentTable').html(response);
                },
                error: function(xhr, status, error) {
                    console.log('Error:', error);
                }
            });
        }

        $(document).ready(function() {
            $('#firstName, #age, #groupTitle, #description, #teacherName, #courseName').keypress(function(event) {
                if (event.which === 13) { // Enter key pressed
                    event.preventDefault(); // Prevent the default form submission
                    search();
                }
            });
        });
    </script>

    <!-- /#page-content-wrapper -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var el = document.getElementById("wrapper");
            var toggleButton = document.getElementById("menu-toggle");

            toggleButton.onclick = function () {
                el.classList.toggle("toggled");
            };

            // Add event listener for double click on the document
            document.addEventListener("dblclick", handleDoubleClick);
        });
    </script>

    
    <!-- Your custom script -->
</body>
</html>
