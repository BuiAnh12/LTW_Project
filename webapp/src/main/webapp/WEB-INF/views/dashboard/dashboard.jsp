<%@page import="com.utils.securityUtil"%>
<%@ page import = "com.utils.securityUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style><%@include file="/WEB-INF/views/dashboard/style.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Admin Dashboard</title>
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
                    <h2 class="fs-2 m-0">Dashboard</h2>
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
                                <i class="fas fa-user me-2"></i> <%=securityUtil.getPrincipal().getFullName()%>
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
			<div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">ACTIVE STUDENT</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.onlineStudent + infoModel.offlineStudent}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        ${infoModel.onlineStudent} Online
                                    </div>
                                    <div class="row">
                                        ${infoModel.offlineStudent} Offline
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">ACTIVE GROUP</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.onlineGroup + infoModel.offlineGroup}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        ${infoModel.onlineGroup} Online
                                    </div>
                                    <div class="row">
                                        ${infoModel.offlineGroup} Offline
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">ACTIVE COURSE</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.activeCourse}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">

                                    </div>
                                    <div class="row">

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">ACTIVE TEACHER</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.userNumber}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">

                                    </div>
                                    <div class="row">

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">ACTIVE USER</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.teacherNumber}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">

                                    </div>
                                    <div class="row">

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="col-md-2 col-sm-12">
                        <div class="p-3 bg-white shadow-sm d-flex rounded">
                            <div class="row">
                                <p class="fs-6">STUDENTS PER GROUP, AVG.</p>
                                <div class="col-6">

                                    <div class="row">
                                        <div class="col-6"></div>
                                    </div>

                                    <div class="col-6">
                                        <h3 class="fs-1">${infoModel.studentPerGroup}</h3>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        ${infoModel.studentPerOnl} Online
                                    </div>
                                    <div class="row">
                                        ${infoModel.studentPerOff} Offline
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="spliter" style="height: 30px;"></div>
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12" style="padding: 10px;">
                                <h3 class="fs-4 mb-3"> Recent Registration Group</h3>
                                <table class="table bg-white rounded shadow-sm  table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="col-3">Title</th>
                                            <th scope="col" class="col-3">Course</th>
                                            <th scope="col" class="col-2">Teacher</th>
                                            <th scope="col" class="col-1">Student</th>
                                            <th scope="col" class="col-1">Start Date</th>
                                            <th scope="col" class="col-1">End Date</th>
                                            <th scope="col" class="col-1">Format</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="student_no" items="${student_no}" varStatus="status">
								    <c:set var="index" value="${status.index}" />
								    <c:if test="${index < fn:length(recentGroup)}">
								        <c:set var="group" value="${recentGroup[index]}" />
								        <tr>
								            <td>
								                <a href="${pageContext.servletContext.contextPath}/subpage/group-detail?groupId=${group.id}">
								                    ${group.title}
								                    <br>
								                    <small>${group.groupDetail}</small>
								                </a>
								            </td>
								            <td>
								                <a href="${pageContext.servletContext.contextPath}/subpage/details-course?courseId=${group.course.courseId}">
								                    ${group.course.courseName}
								                </a>
								            </td>
								            <td>${group.mainTeacher.name}</td>
								            <td>${student_no}</td>
								            <td>${group.startDate}</td>
								            <td>${group.endDate}</td>
								            <td>
								                <c:choose>
								                    <c:when test="${group.format}">
								                        Online
								                    </c:when>
								                    <c:otherwise>
								                        Offline
								                    </c:otherwise>
								                </c:choose>
								            </td>
								        </tr>
								    </c:if>
								</c:forEach>


                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
			
    </div>
    <!-- /#page-content-wrapper -->
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