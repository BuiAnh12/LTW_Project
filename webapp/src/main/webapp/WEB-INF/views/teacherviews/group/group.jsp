<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.utils.securityUtil"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <style><%@include file="/WEB-INF/views/schedule/style.css"%></style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-DI/U+B20M5d4fD2UG+P8BGO35nqYjT9tlxG6t2vIY2CH6azYH2i4MIZhf4oAVvrj" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <base href="${pageContext.servletContext.contextPath}">
    <title>Groups</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div>
        <%@include file="/WEB-INF/views/teacherpanel.jsp"%>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Teacher's groups</h2>
                </div>
				<%@include file="/WEB-INF/views/group/addGroupModal.jsp" %>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
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
                                <li><a class="dropdown-item" href="<c:url value='thoat'/>"><%=securityUtil.getPrincipal().getPreveledge() %></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
			<div class="divider" style="margin: 0;padding: 0"></div>
            <div class="container">
                <!-- button area -->
                <div class="row">
                    <div class="col-6">

                    </div>
                </div>
                <form action="#" method="POST">
                <!-- table content -->
                <div class="row my-2 ">
                    <!-- <h3 class="fs-4 mb-3">Schedue</h3> -->
                    <div class="col"  id="groupTable">
                        <table class="table-custom bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>

                                    <th scope="col" style="width: 300px;">Title</th>
                                    <th scope="col">Students</th>
                                    <th scope="col">Teacher</th>
                                    <th scope="col">Supervisor</th>
                                    <th scope="col">Course</th>
                                    <th scope="col">Format</th>
                                </tr>
                                <tr>
						            <th scope="col" style="width: auto;">
						                <input type="text"  class="form-control" id="title_search" placeholder="" aria-label="Title" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text"  class="form-control" id="student_search" placeholder="" aria-label="Student" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text"  class="form-control" id="teacher_search" placeholder="" aria-label="Teacher" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text"  class="form-control" id=supervisor_search placeholder="" aria-label="Supervisor" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text"  class="form-control" id="course_search" placeholder="" aria-label="Course" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" class="form-control" id="format_search" placeholder="" aria-label="Format" aria-describedby="basic-addon1">
						            </th>
						        </tr>
                            </thead>
								<tbody>
									<c:forEach items="${groupList}" var="group">
										<tr>
											<td><a href="${pageContext.servletContext.contextPath}/teachersubpage/group-detail?groupId=${group.id}">${group.title}<br><small class="small-text"></small></a></td>
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
									</c:forEach>

								</tbody>
							</table>
							<div class="table-footer">
                    <c:set var="prefixUrl" value="${pageContext.servletContext.contextPath}/category/group?page=" scope="page" />
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
                </form>
            </div>
	<div class="footer" style="m-0">
				<%@include file="/WEB-INF/views/footer.jsp"%></div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
	<script>
		function openModal() {
			document.getElementById("myModal").style.display = "block";
		}

		function closeModal() {
			document.getElementById("myModal").style.display = "none";
		}

		window.onclick = function(event) {
			if (event.target == document.getElementById("myModal")) {
				closeModal();
			}
		}
	</script>
	<script type="text/javascript">
		function search() {
		    $.ajax({
		        url: '${pageContext.servletContext.contextPath}/category/group.htm',
		        type: 'GET',
		        data: {
		            title: $('#title_search').val(),
		            student: $('#student_search').val(),
		            teacher: $('#teacher_search').val(),
		            supervisor: $('#supervisor_search').val(),
		            course: $('#course_search').val(),
		            format: $('#format_search').val()
		        },
		        success: function(response) {
		            $('#groupTable').html(response);
		        },
		        error: function(xhr, status, error) {
		            console.log('Error:', error);
		        }
		    });
        }

		$(document).ready(function() {
		    // Bind keydown event instead of keypress for better compatibility
		    $('#title_search, #student_search, #teacher_search, #supervisor_search, #course_search, #format_search').keydown(function(event) {
		        if (event.which === 13) { // Enter key pressed
		        	// Prevent the default form submission
		            search(); // Call the search function
		        }
		    });
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