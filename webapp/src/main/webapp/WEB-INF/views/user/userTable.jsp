<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                   
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Account Username</th>
                                    <th scope="col">Status</th>
                                   
                                </tr>
                                <tr>
                                    <th scope="col">
								        <input id="id_search" value="${sId}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="name_search"  value="${sName}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="phone_search"  value="${sPhone}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="email_search"  value="${sEmail}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="role_search"  value="${sRole}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="account_search"  value="${sAccount}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="status_search"  value="${sStatus}" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
                                </tr>
                            </thead>
							<tbody>
								<!--Insert data  -->

								<c:forEach items="${userList}" var="user">
									<tr>
										<td>${user.userId}</td>
										<td><a
											href="${pageContext.servletContext.contextPath}/subpage/userdetail?userid=${user.userId}">${user.userName}</a></td>
										<td>${user.userPhone}</td>
										<td>${user.userEmail}</td>
										<td>${user.userRoleName}</td>
										<td>${user.accountUserName}</td>
										<td><c:choose>
												<c:when test="${user.userStatus == true}">
						                    Active
						                </c:when>
												<c:otherwise>
						                    InActive
						                </c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div class="table-footer">
                    <c:set var="prefixUrl" value="${pageContext.servletContext.contextPath}/category/user?page=" scope="page" />
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
	            url: '${pageContext.servletContext.contextPath}/category/user.htm',
	            type: 'GET',
	            data: {
	                id: $('#id_search').val(),
	                name: $('#name_search').val(),
	                phone: $('#phone_search').val(),
	                email: $('#email_search').val(),
	                role: $('#role_search').val(),
	                account: $('#account_search').val(),
	                status: $('#status_search').val()
	            },
	            success: function(response) {
	                $('#userTable').html(response);
	            },
	            error: function(xhr, status, error) {
	                console.log('Error:', error);
	            }
	        });
	    }
	
	    $(document).ready(function() {
	        // Bind keydown event instead of keypress for better compatibility
	        $('#id_search, #name_search, #phone_search, #email_search, #role_search, #account_search, #status_search').keydown(function(event) {
	            if (event.which === 13) { // Enter key pressed
	                event.preventDefault(); // Prevent the default form submission
	                search(); // Call the search function
	            }
	        });
	    });
	</script>