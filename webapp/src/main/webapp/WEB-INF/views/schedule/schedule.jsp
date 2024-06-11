<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.utils.securityUtil"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <style><%@include file="/WEB-INF/views/schedule/style.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style><%@include file="/WEB-INF/views/schedule/style.css"%></style>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/core@1.6.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.6.3"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-DI/U+B20M5d4fD2UG+P8BGO35nqYjT9tlxG6t2vIY2CH6azYH2i4MIZhf4oAVvrj" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .small-text {
            font-size: 80%; /* Adjust the percentage to your desired size */
        }
    </style>

    <title>Schedule</title>
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
                    <h2 class="fs-2 m-0">Schedule</h2>
                </div>

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
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container">
					

                   <!-- tableContent -->
                    <div class="row my-2 "> 
                        <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                        <div class="col" id="scheduleTable">
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                    <tr>
                                      
                                        <th scope="col">Date & times</th>
                                        <th scope="col">Next lesson</th>
                                        <th scope="col">Course </th>
                                        <th scope="col">Group Title</th>
                                        <th scope="col">Lesson Teacher</th>
                                        <th scope="col">Format</th>
                                       
                                    </tr>
                                    <tr>
                                        <th scope="col">
                                            <!-- <input type="date" class="form-control" placeholder=""
                                                aria-label="date" aria-describedby="basic-addon1"> -->
                                            <div id="reportrange"
                                                class="form-control d-flex align-items-center no-wrap small-text"
                                                aria-label="date"  path="OccurDate"
                                                style="cursor: pointer; padding: 5px; border: 1px solid #ccc;"
                                                aria-describedby="basic-addon1">
                                                <span></span>
                                            </div>
                                        </th>
                                        <th scope="col"><input type="text" id="nextLesson" class="form-control" placeholder="" aria-label="nextLesson" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input type="text" id="courseName"  class="form-control" placeholder="" aria-label="courseName" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input type="text" id="groupTitle"  class="form-control" placeholder="" aria-label="groupTitle" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input type="text" id="teacherName"  class="form-control" placeholder="" aria-label="teacherName" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input type="text" id="format" class="form-control" placeholder="Format" aria-label="format" aria-describedby="basic-addon1"/></th>

                                    </tr>
                                </thead>
                                <tbody id="scheduleTable">
									<c:forEach var="schedule" items="${schedules}">
                                    <tr>
                                        <th><small class="small-text">${schedule.occurDate}</small></th>
                                        <td><small class="small-text">${schedule.nextLesson}</small></td>
                                        <td><a href="course/course/${schedule.courseId}.htm">${schedule.courseName}</td>
                                        <td><a href="group/group/${schedule.groupId}.htm">${schedule.groupTitle}
                                        	<br>
                                        	<small class="small-text">${schedule.groupDetail}</small>
                                        </td>
                                        <td><a href="teacher/teacher/${schedule.teacherId}.htm">${schedule.teacherName}</td>
                                        <td><small class="small-text">${schedule.format}</small></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="table-footer">
                    <c:set var="prefixUrl" value="${pageContext.servletContext.contextPath}/category/schedule?page=" scope="page" />
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
    <script type="text/javascript">
	    $(function () {
	        // Initialize the start and end dates
	        const initialStartDate = moment()
	        const initialEndDate = moment();
	        
	        // Define the constants for startDate and endDate
	        let startDate = initialStartDate;
	        let endDate = initialEndDate;
			function search(){
				$.ajax({
	                url: '${pageContext.servletContext.contextPath}/category/schedule.htm',
	                type: 'GET',
	                data: {
	                    startDate: startDate.format('YYYY-MM-DD'),
	                    endDate: endDate.format('YYYY-MM-DD'),
	                    nextLesson: $('#nextLesson').val(),
	                    courseName: $('#courseName').val(),
	                    groupTitle: $('#groupTitle').val(),
	                    teacherName: $('#teacherName').val(),
	                    format: $('#format').val()
	                },
	                success: function(response) {
	                	$('#scheduleTable').html(response);
	                },
	                error: function(xhr, status, error) {
	                    // Handle any errors
	                    console.log('Error:', error);
	                }
	            });
			}
	        
	        function inital_cb(start, end) {
	            // Update the constants with the new selected dates
	            startDate = start;
	            endDate = end;
	
	            // Update the date range display
	            $('#reportrange span').html(start.format('DD-MM-YY') + ' - ' + end.format('DD-MM-YY'));

	            
	        }
	        
	        function cb(start, end) {
	            // Update the constants with the new selected dates
	            startDate = start;
	            endDate = end;
	
	            // Update the date range display
	            $('#reportrange span').html(start.format('DD-MM-YY') + ' - ' + end.format('DD-MM-YY'));
	            search();
	            // Make the AJAX request with the selected dates and other form values
	            
	        }
	
	        // Initialize the date range picker with the initial dates and callback function
	        $('#reportrange').daterangepicker({
	            startDate: initialStartDate,
	            endDate: initialEndDate,
	            ranges: {
	               'Today': [moment(), moment()],
	               'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	               'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	               'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	               'This Month': [moment().startOf('month'), moment().endOf('month')],
	               'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	            }
	        }, cb);
	
	        // Call the callback function to set the initial state
	        inital_cb(initialStartDate, initialEndDate);
	        
	        $('#nextLesson, #courseName, #groupTitle, #teacherName, #format').keypress(function(event) {
	            if (event.which === 13) { // Enter key pressed
	            	search();
	            }
	        });
	    });
	</script>

    
</body>

</html>
