<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.utils.securityUtil"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-DI/U+B20M5d4fD2UG+P8BGO35nqYjT9tlxG6t2vIY2CH6azYH2i4MIZhf4oAVvrj" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style><%@include file="/WEB-INF/views/schedule/style.css"%></style>
    <title>User</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <%@include file="/WEB-INF/views/panel.jsp"%>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Users</h2>
                </div>

                <div>
                    <button class="btn-sm " disabled style="color: transparent; border: none;"></button>
                    <a href="${pageContext.servletContext.contextPath}/subpage/addUser" ><button class="btn-sm btn-success " style="font-weight: bold;">Add User</button></a>
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
            <div class="divider" style="margin: 0;padding: 0"></div>
            <div class="container">
                <!-- button area -->
              
                <!-- table content  -->
                <div class="row my-2 "> 
                    <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                    <div class="col">

                        <div class="row py-2">
                        </div>
					<div class="col" id ="userTable">
                        <table class="table-custom bg-white rounded shadow-sm  table-hover">
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
								        <input id="id_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="name_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="phone_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="email_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="role_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="account_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
								    </th>
								    <th scope="col">
								        <input id="status_search" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
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
            </div>
                    </div>
                </div>
            </div>
            <div class="footer" style="m-0">
				<%@include file="/WEB-INF/views/footer.jsp"%></div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
					var el = document.getElementById("wrapper");
					var toggleButton = document.getElementById("menu-toggle");

					toggleButton.onclick = function() {
						el.classList.toggle("toggled");
					};
				</script>
</body>

</html>