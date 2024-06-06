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
                <form:form action="/webapp/schedule/search.htm" method="get" modelAttribute="searchForm">
					    <div class="row col-1">
					        <div class="btn-group">
					           
					            <button type="submit" class="btn btn-outline-success">Search</button>
					        </div> 
					    </div>
					

                   <!-- tableContent -->
                    <div class="row my-2 "> 
                        <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                        <div class="col">
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
                                                aria-label="date" th:field="*{occurDate}"
                                                style="cursor: pointer; padding: 5px; border: 1px solid #ccc;"
                                                aria-describedby="basic-addon1">
                                                <span></span>
                                            </div>
                                        </th>
                                        <th scope="col"><input type="text" th:field="*{nextLesson}" class="form-control" placeholder="" aria-label="nextLesson" aria-describedby="basic-addon1"/></th>
                                        <th scope="col"><input type="text" th:field="*{courseName}" class="form-control" placeholder="" aria-label="courseName" aria-describedby="basic-addon1"/></th>
                                        <th scope="col"><input type="text" th:field="*{groupTitle}" class="form-control" placeholder="" aria-label="groupTitle" aria-describedby="basic-addon1"/></th>
                                        <th scope="col"><input type="text" th:field="*{teacherName}" class="form-control" placeholder="" aria-label="teacherName" aria-describedby="basic-addon1"/></th>
                                        <th scope="col"><input type="text" th:field="*{format}" class="form-control" placeholder="Format" aria-label="format" aria-describedby="basic-addon1"/></th>
                                    </tr>
                                </thead>
                                </form:form>
                                <tbody>
                                    <tr>
                                        <!-- <th scope="row">1</th> -->
                                        <td><small class="small-text">04.03.2024 15:00</small></td>
                                        <td><small class="small-text">Adding riddles and puzzles to the quest ENG GD M2L4</small></td>
                                        <td><small class="small-text">Game Development</small></td>
                                        <td><small class="small-text">NVH_GD65_MON_OFF 3:00 PM - 4:30 PMPreferred Language: ENG</small></td>
                                        <td><small class="small-text">Tom</small></td>

                                        <td><small class="btn-sm btn-primary" aria-disabled="true">Offline</small></td>
                                      
                                    </tr>
									<c:forEach var="schedule" items="${schedules}">
                                    <tr>
                                        <th><small class="small-text">${schedule.occurDate}</small></th>
                                        <td><small class="small-text"><a href="lesson/lesson/${schedule.lessonId}.htm">${schedule.nextLesson}</small></td>
                                        <td><small class="small-text"><a href="course/course/${schedule.courseId}.htm">${schedule.courseName}</small></td>
                                        <td><small class="small-text"><a href="group/group/${schedule.groupId}.htm">${schedule.groupTitle}</small></td>
                                        <td><small class="small-text"><a href="teacher/teacher/${schedule.teacherId}.htm">${schedule.teacherName}</small></td>
                                        <td><small class="small-text">${schedule.format}</small></td>
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

            var start = moment().subtract(29, 'days');
            var end = moment();

            function cb(start, end) {
                $('#reportrange span').html(start.format('DD-MM-YY') + ' - ' + end.format('DD-MM-YY'));
                $.ajax({
                    url: '/getScheduleByDateRange',
                    type: 'GET',
                    data: {
                        startDate: start.format('YYYY-MM-DD'),
                        endDate: end.format('YYYY-MM-DD')
                    }
                });
            }

            $('#reportrange').daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
            }, cb);

            cb(start, end);

        });
    </script>
    <script>
        $(document).ready(function () {
            $('#format-select').select2({
                minimumResultsForSearch: Infinity, // Hides the search box
                width: '100%' // Adjust width as needed
            });
        });
    </script>
    
</body>

</html>
