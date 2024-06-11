<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table bg-white rounded shadow-sm  table-hover">
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
						                <input type="text" value="${sTitle}"  class="form-control" id="title_search" placeholder="" aria-label="Title" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" value="${sStudent}"   class="form-control" id="student_search" placeholder="" aria-label="Student" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" value="${sTeacher}"   class="form-control" id="teacher_search" placeholder="" aria-label="Teacher" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" value="${sSupervisor}"   class="form-control" id=supervisor_search placeholder="" aria-label="Supervisor" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" value="${sCourse}"  class="form-control" id="course_search" placeholder="" aria-label="Course" aria-describedby="basic-addon1">
						            </th>
						            <th scope="col">
						                <input type="text" value="${sFormat}"  class="form-control" id="format_search" placeholder="" aria-label="Format" aria-describedby="basic-addon1">
						            </th>
						        </tr>
                            </thead>
								<tbody>
									<c:forEach items="${groupList}" var="group">
										<tr>
											<td><a href="${pageContext.servletContext.contextPath}/subpage/group-detail?groupId=${group.id}"><small class="small-text">${group.title}</small></a></td>
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
					
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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