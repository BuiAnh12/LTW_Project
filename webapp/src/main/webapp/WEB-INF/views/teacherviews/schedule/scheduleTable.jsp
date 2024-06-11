<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    

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
                                        <th scope="col"><input value="${sLesson}" type="text" id="nextLesson" class="form-control" placeholder="" aria-label="nextLesson" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input value="${sCourse}" type="text" id="courseName"  class="form-control" placeholder="" aria-label="courseName" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input value="${sTitle}" type="text" id="groupTitle"  class="form-control" placeholder="" aria-label="groupTitle" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input value="${sTeacher}" type="text" id="teacherName"  class="form-control" placeholder="" aria-label="teacherName" aria-describedby="basic-addon1"/></th>
										<th scope="col"><input value="${sStatus}" type="text" id="format" class="form-control" placeholder="Format" aria-label="format" aria-describedby="basic-addon1"/></th>

                                    </tr>
                                </thead>
                                <tbody >
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

                                