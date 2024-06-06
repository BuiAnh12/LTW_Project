<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page pageEncoding="utf-8"%>
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
    <style><%@include file="/WEB-INF/views/student/style.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Admin Dashboard</title>
  </head>

  <body>
    <div class="d-flex" id="wrapper">
      <!-- Sidebar -->
      <div class="bg-white" id="sidebar-wrapper">
        <div
          class="sidebar-heading text-center py-4 primary-text fs-5 fw-bold text-uppercase border-bottom"
        >
          <i class="fas fa-user-secret me-2"></i>CodeXpert
        </div>
        <div class="list-group list-group-flush my-3">
          <a
            href="index.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a
          >
          <a
            href="schedule.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-project-diagram me-2"></i>Schedue</a
          >
          <a
            href="group.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-chart-line me-2"></i>Group</a
          >
          <a
            href="student.htm"
            class="list-group-item list-group-item-action bg-transparent second-text active"
            ><i class="fas fa-paperclip me-2"></i>Student</a
          >
          <a
            href="course.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-shopping-cart me-2"></i>Course</a
          >
          <a
            href="employees.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-gift me-2"></i>Employees</a
          >
          <a
            href="venues.htm"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-map-marker-alt me-2"></i>Venues</a
          >
          <a
            href="#"
            class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
            ><i class="fas fa-comment-dots me-2"></i>Extra</a
          >
          <a
            href="#"
            class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"
            ><i class="fas fa-power-off me-2"></i>Logout</a
          >
        </div>
      </div>
      <!-- /#sidebar-wrapper -->

      <!-- Page Content -->
      <!-- Top nav Content -->
      <div id="page-content-wrapper">
        <nav
          class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4"
        >
          <div class="d-flex align-items-center">
            <i
              class="fas fa-align-left primary-text fs-4 me-3"
              id="menu-toggle"
            ></i>
            <h2 class="fs-2 m-0">Students</h2>
          </div>

          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle second-text fw-bold"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
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
          <!-- table content  -->
          <div class="row my-2">
            <div class="row my-2">
              <div class="col-6" style="text-align: left">
                <div>
                  <button
                    class="btn-md btn-success btn-add"
                    onclick="window.location.href='student/insert.htm'"
                  >
                    Add
                  </button>
                </div>
              </div>
              <div class="col-6" style="text-align: right" id="name">
                <div class="btn-group">
                  <button
                    type="button"
                    class="btn btn-outline-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    Columns
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                  </div>
                </div>

                <div class="btn-group">
                  <button
                    type="button"
                    class="btn btn-outline-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    Exports
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                  </div>
                </div>

                <button class="btn btn-outline-success">Clear Filter</button>
                <span>Records on Page</span>
                <div class="btn-group">
                  <button
                    type="button"
                    class="btn btn-outline-success dropdown-toggle"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
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
          </div>

          <div class="col">
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
                    <input
                      type="text"
                      class="form-control"
                      placeholder=""
                      aria-label="first-name"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                  <th scope="col">
                    <input
                      type="text"
                      class="form-control"
                      placeholder=""
                      aria-label="age"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                  <th scope="col">
                    <input
                      type="text"
                      class="form-control"
                      placeholder=""
                      aria-label="group"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                  <th scope="col">
                    <input
                      type="text"
                      class="form-czontrol"
                      placeholder=""
                      aria-label="description"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                  <th scope="col">
                    <input
                      type="text"
                      class="form-control"
                      placeholder=""
                      aria-label="teacher"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                  <th scope="col">
                    <input
                      type="text"
                      class="form-control"
                      placeholder=""
                      aria-label="course"
                      aria-describedby="basic-addon1"
                    />
                  </th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="student" items="${students}">
              	<tr>
              		<td>
                    <small class="small-text"> <a
                      href="${pageContext.request.contextPath}/student/detail/${student.id}"
                      style="text-decoration: none; color: rgb(25, 0, 255)"
                      >${student.firstname}</a
                    ></small>
                  </td>
	                <td><small class="small-text">${student.age}</small></td>
	                  <td><small class="small-text">group_title</small></td>
	                  <td><small class="small-text">group_description</small></td>
	                  <td><small class="small-text">group_teacher</small></td>
	                  <td><small class="small-text">group_course</small></td>
	                <!-- Add other columns as needed -->
            	</tr>
            	</c:forEach>
                <tr>
                  <td>
                    <small class="small-text"></small
                    ><a
                      href="#"
                      style="text-decoration: none; color: rgb(25, 0, 255)"
                      >Tom Bui</a
                    >
                  </td>
                  <td><small class="small-text">10</small></td>
                  <td><small class="small-text">group_title</small></td>
                  <td><small class="small-text">group_description</small></td>
                  <td><small class="small-text">group_teacher</small></td>
                  <td><small class="small-text">group_course</small></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- /#page-content-wrapper -->
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
          el.classList.toggle("toggled");
        };

        // Add event listener for double click on the document
        document.addEventListener("dblclick", handleDoubleClick);
      });
    </script>

    <!-- Bootstrap Bundle with Popper (JS) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- Your custom script -->
  </body>
</html>
