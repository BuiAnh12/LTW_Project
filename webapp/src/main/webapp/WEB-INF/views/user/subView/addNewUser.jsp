<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="../../styles/styles.css" />
    <style><%@include file="/WEB-INF/views/user/subView/addNew.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>User</title>
    <style>
       #submitTable{
        background-color: darkgray;
       }

    </style>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">User</h2>
                </div>

                <div>
                    <button class="btn-sm " disabled style="color: transparent; border: none;"></button>
                    <a href="#"><button class="btn-sm btn-success">Add</button></a>
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
             
                <!-- FormInsert -->
                <form:form method="POST" action="/webapp/manager/addUser.htm" modelAttribute="userObject">
                    <div class="table py-2 px-2 bg-white rounded shadow-sm col-12" id="submitTable">
                     <div class="row">
                     	<div class="row">
                     		<span class="text-center fw-bold" style="font-size:150%;">INSERT NEW USER</span>
                     	</div>
                             <!-- INFORMATION -->    
                        <div class="col-6">
                            <div class="row">
                                <span class=" text-center fw-bold" style="font-size: large;">INFORMATION</span>
                            </div>

                            <div class="row">  
                                <div class="col-6">
                                    <Span class="fw-bold">Name</Span>
                                     <input type="text" name="userName" class="form-control" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1" value="${userObject.userName}" required> 
                                     
                                </div>
                                <div class="col-6">
                                    <Span class="fw-bold">Phone</Span>
                                    <input type="text" name="userPhone" class="form-control" placeholder="Phone" aria-label="Username" aria-describedby="basic-addon1" value="${userObject.userPhone }" required>  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <Span class="fw-bold">Email</Span>
                                    <input type="text" name="userEmail" class="form-control" placeholder="Email" aria-label="Username" aria-describedby="basic-addon1" value="${userObject.userEmail }" required> 
                                </div>    
                            </div>
                            <div class="row ">   
                                <div class="col-6">
                                    <Span class="fw-bold">Role</Span>
                                   <select class="form-control" aria-label="Role" aria-describedby="basic-addon1" name="userRole" data="${userObject.useRole}" >
								        <option value="1">Giảng Viên</option>
								        <option value="2">Học Sinh</option>
								    </select>
                                </div>
                                <div class="col-6">
                                    <Span class="fw-bold">Offices</Span>
                                    <input type="text" class="form-control" placeholder="Them cho co" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled"> 
                                </div>     
                            </div>
                        </div>
                        <!-- ACCOUNT -->     
                        <div class="col-6 ">
                            <div class="row mx-auto">
                                <span class=" text-center fw-bold " style="font-size: large;">ACCOUNT</span>
                            </div>                            
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6">                                   
                                    <span class="fw-bold">Username</span>
                                    <input type="text" name="accountDto.accountUsername" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"  value="${userObject.accountDto.accountUsername }" required>   
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-7  ">
                                    <Span class="fw-bold">Password</Span>
                                    <div class="row">
                                        <div class="col-10">
                                            <input type="password" id="password" name="accountDto.accountPassword" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="showPassword" required value="${userObject.accountDto.accountPassword }">
                                        </div>
                                        <div class="col-2">
                                            <span class= " show-hide-password-eye " onclick="togglePasswordVisibility()">
                                                <i id="showCursor" class="fas fa-eye-slash"></i>
                                            </span> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3"></div>
                                <div class="col-6">
                                    <span></span>
                                    <a href="#">
                                        <button type="submit" class="btn-sm mx-2 btn-outline-success fw-bold" style="color: black;"  >Submit</button>
                                    </a>
                                    <a href="#">
                                        <button type="" class="btn-sm btn-outline-danger fw-bold" style="color: black;">Cancel</button>
                                    </a>
                                </div>
                            </div>

                        </div>
                      </div>
                    </div>
              
             </form:form>
                <!-- table content  -->
                <div class="row my-2 "> 
                    
                    <div class="col">

                        <div class="row py-2">
                            <!-- <div class="col-9" style="text-align: left;">
                                <span>Showing....</span>
                            </div> -->
                            <!-- <div class="col-3" style="text-align: right;">
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
                            </div> -->
                        </div>

                       

                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                   
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Offices</th>
                                   
                                </tr>
                                <tr>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"> <input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
    <!-- /#page-content-wrapper -->
    </div>
      <!-- Include Bootstrap JS (for input group functionality) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <script>
         function togglePasswordVisibility() {
             var passwordInput = document.getElementById('password');
             var showIcon = document.getElementById('showCursor');
 
             if (passwordInput.type === 'password') {
                 passwordInput.type = 'text';
                 showIcon.classList.remove('fa-eye-slash');
                 showIcon.classList.add('fa-eye');
             } else {
                 passwordInput.type = 'password';
                 showIcon.classList.remove('fa-eye');
                 showIcon.classList.add('fa-eye-slash');
             }
         }
     </script>
</body>

</html>