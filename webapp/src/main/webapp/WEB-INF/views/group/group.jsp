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
  <style><%@include file="/WEB-INF/views/group/style.css"%></style>
  <base href="${pageContext.servletContext.contextPath}/">
    <title>Groups</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div>
        <%@include file="/WEB-INF/views/panel.jsp"%>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Groups</h2>
                </div>

                <div>
                    <button class="btn-sm " disabled style="color: transparent; border: none;"></button>
                    <button class="btn-sm btn-success" onclick="openModal()">Add Group</button>
                </div>
                <div id="myModal" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <div class="divider" style="height: 20px;"></div>
                        <h2>Add student</h2>
                        <div class="modal-main-content">
                            <div class="col">
                                <div class="row form-container">
                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="start-date">Title:</label>
                                        <input type="text" id="title" class="form-control" value="NVH_GD65_MON_OFF">
                                    </div>

                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="start-date">Note:</label>
                                        <input type="text" id="note" class="form-control" value="2:00 - 3:30">
                                    </div>
                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="start-date">Start Date:</label>
                                        <input type="date" id="start-date" class="form-control" value="2023-12-12">
                                    </div>
                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="main-teacher">Main Teacher:</label>
                                        <select id="main-teacher" class="form-control">
                                            <option value="" selected disabled>Select Main Teacher</option>
                                            <option value="teacher1" selected>Teacher 1</option>
                                            <option value="teacher2">Teacher 2</option>
                                            <option value="teacher3">Teacher 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="course">Course:</label>
                                        <select id="course" class="form-control">
                                            <option value="" selected disabled>Select Course</option>
                                            <option value="course1" selected>Course 1</option>
                                            <option value="course2">Course 2</option>
                                            <option value="course3">Course 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="end-date">End Date:</label>
                                        <input type="date" id="end-date" class="form-control" value="2023-12-12">
                                    </div>

                                    <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                        <label for="supervisor">Supervisor:</label>
                                        <select id="supervisor" class="form-control">
                                            <option value="" selected disabled>Select Supervisor</option>
                                            <option value="supervisor1" selected>Supervisor 1</option>
                                            <option value="supervisor2">Supervisor 2</option>
                                            <option value="supervisor3">Supervisor 3</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="divider" style="height: 10px;"></div>
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-primary" onclick="submitSelection()">Submit</button>
                        </div>
                    </div>
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
                <div class="row">
                    <div class="col-6">

                    </div>
                </div>

                <!-- table content -->
                <div class="row my-2 ">
                    <!-- <h3 class="fs-4 mb-3">Schedue</h3> -->
                    <div class="col">
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
                                    <th scope="col" style="width: auto;"><input type="text" class="form-control"
                                            placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder=""
                                            aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder=""
                                            aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"> <input type="text" class="form-control" placeholder=""
                                            aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder=""
                                            aria-label="Username" aria-describedby="basic-addon1"></th>
                                    <th scope="col"><input type="text" class="form-control" placeholder=""
                                            aria-label="Username" aria-describedby="basic-addon1"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td><small class="small-text">NVH_GD65_MON_OFF 3:00 PM - 4:30 PMPreferred Language:
                                            ENG</small></td>
                                    <td><small class="small-text">4</small></td>
                                    <td><small class="small-text">Tom</small></td>
                                    <td><small class="small-text">Nicky</small></td>
                                    <td><small class="small-text">Game Development</small></td>
                                    <td><small class="btn-sm btn-primary" aria-disabled="true">Offline</small></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /#page-content-wrapper -->
    </div>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
    <script>
        function openModal() {
            document.getElementById("myModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>