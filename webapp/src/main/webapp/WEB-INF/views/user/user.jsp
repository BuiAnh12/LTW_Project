<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <base href="${pageContext.servletContext.contextPath}/">
    <style><%@include file="/WEB-INF/views/course/style.css"%></style>
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
                <!-- button area -->
              
                <!-- table content  -->
                <div class="row my-2 "> 
                    <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                    <div class="col">

                        <div class="row py-2">
                            <div class="col-9" style="text-align: left;">
                                <span>Showing....</span>
                            </div>
                            <div class="col-3" style="text-align: right;">
                                <span>Records on Page</span>
                                <div class="btn-group">
                                  <button type="button" disabled class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    20
                                  </button>
                                  <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Option 1</a>
                                    <a class="dropdown-item" href="#">Option 2</a>
                                    <a class="dropdown-item" href="#">Option 3</a>
                                  </div>
                                </div> 
                            </div>
                        </div>

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
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"> <input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                     <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
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

					toggleButton.onclick = function() {
						el.classList.toggle("toggled");
					};
				</script>
</body>

</html>