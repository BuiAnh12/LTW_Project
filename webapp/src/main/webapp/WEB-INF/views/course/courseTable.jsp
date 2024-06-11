<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<table class="table">
								<thead>
									<tr>
										<th scope="col">Name Course</th>
										<th scope="col">Description</th>
										<th scope="col">Status</th>
									</tr>
									<tr>
										<th scope="col"><input type="text" class="form-control"
											placeholder="" aria-label="Username" id = "coursename" value="${courseName}"
											aria-describedby="basic-addon1"></th>
										<th scope="col"><input type="text"
											class="form-control bg-transparent border-0" placeholder="" 
											aria-label="Username" aria-describedby="basic-addon1"
											disabled></th>
										<th scope="col"><input type="text" class="form-control" value="${status}"
											placeholder="" aria-label="Username" id = "status"
											aria-describedby="basic-addon1"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courseList}" var="course">
										<tr>
											<td><a
												href="${pageContext.servletContext.contextPath}/subpage/details-course?courseId=${course.courseId}">
													${course.courseName} </a></td>
											<td>${course.description}</td>
											<td>
											  <c:choose>
											    <c:when test="${course.status}">
											      Enable
											    </c:when>
											    <c:otherwise>
											      Disable
											    </c:otherwise>
											  </c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="table-footer">
                    <c:set var="prefixUrl" value="${pageContext.servletContext.contextPath}/category/course?page=" scope="page" />
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
							<script>
		var el = document.getElementById("wrapper");
		var toggleButton = document.getElementById("menu-toggle");

		toggleButton.onclick = function() {
			el.classList.toggle("toggled");
		};
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
        function search() {
            $.ajax({
                url: '${pageContext.servletContext.contextPath}/category/course.htm',
                type: 'GET',
                data: {
                    courseName: $('#coursename').val(),
                    status: $('#status').val()
                },
                success: function(response) {
                    $('#content_table').html(response);
                },
                error: function(xhr, status, error) {
                    console.log('Error:', error);
                }
            });
        }

        $(document).ready(function() {
            $('#coursename, #status').keypress(function(event) {
                if (event.which === 13) { // Enter key pressed
                    event.preventDefault(); // Prevent the default form submission
                    search();
                }
            });
        });
    </script>
							