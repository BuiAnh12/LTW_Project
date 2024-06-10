<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                                    <input type="text" value="${sName}" id="firstName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" value="${sAge}" id="age" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" value="${sTitle}" id="groupTitle" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" value="${sDesc}" id="description" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col"> 
                                    <input type="text" value="${sTeacher}" id="teacherName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                                <th scope="col">
                                    <input type="text" value="${sCourse}" id="courseName" class="form-control" placeholder="" aria-label="first-name" aria-describedby="basic-addon1" />
                                </th>
                            </tr>
                        </thead>
                        <tbody >
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td><small class="small-text"><a href="${pageContext.request.contextPath}/student/detail/${student.id}" style="text-decoration: none; color: rgb(25, 0, 255)">${student.firstName}</a></small></td>
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
						                    <i class="fa-solid fa-angle-left">  </i>
						                </a>
						            </c:when>
						            <c:otherwise>
						                <a>
						                    <i class="fa-solid fa-angle-left">  </i>
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