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
    <style><%@include file="/WEB-INF/views/schedule/style.css"%></style>
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/core@1.6.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.6.3"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <style>
        .small-text {
            font-size: 80%; /* Adjust the percentage to your desired size */
        }
    </style>

    <title>Schedule</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-5 fw-bold text-uppercase border-bottom"><i
                    class="fas fa-user-secret me-2"></i>CodeXpert</div>
            <div class="list-group list-group-flush my-3">
                <a href="index.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                    class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="schedule.html" class="list-group-item list-group-item-action bg-transparent second-text active"><i
                        class="fas fa-project-diagram me-2"></i>Schedule</a>
                <a href="group.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-chart-line me-2"></i>Group</a>
                <a href="student.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-paperclip me-2"></i>Student</a>
                <a href="course.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-shopping-cart me-2"></i>Course</a>
                <a href="employees.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-gift me-2"></i>Employees</a>
                <a href="venues.html" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-map-marker-alt me-2"></i>Venues</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-comment-dots me-2"></i>Extra</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <!-- Top nav Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Schedule</h2>
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

                <div class="row gy-0">
                    <div class="col-6" style="font-size: 90%;">
                        <ul class="nav justify-content-start" style="width: fit-content;">
                        <li class="nav-item">
                          <a class="nav-link active" href="#">Today</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">This week</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">Next week</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link " href="#">All</a>
                        </li>
                    </div>
                    <div class="col-6" style="text-align: right-5px ;">
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Columns
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="#">Option 1</a>
                              <a class="dropdown-item" href="#">Option 2</a>
                              <a class="dropdown-item" href="#">Option 3</a>
                            </div>
                          </div>

                          <div class="btn-group">
                            <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <button type="button" class="btn btn-outline-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              20
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="#">Option 1</a>
                              <a class="dropdown-item" href="#">Option 2</a>
                              <a class="dropdown-item" href="#">Option 3</a>
                            </div>
                          </div> 
                         
                    </div>
                   <!-- tableContent -->
                    <div class="row my-2 "> 
                        <!-- <h3 class="fs-4 mb-3">Schedue</h3> --> 
                        <div class="col">
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                    <tr>
                                      
                                        <th scope="col">Date & times</th>
                                        <th scope="col">Next lesson</th>
                                        <th scope="col">Group Title </th>
                                        <th scope="col">Day</th>
                                        <th scope="col">Leason Teacher</th>
                                        <th scope="col">Format</th>
                                       
                                    </tr>
                                    <tr>
                                        <!-- <th scope="col" width="50"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th> -->
                                        <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                        <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                        <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                        <th scope="col"> <input type="date" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                        <th scope="col"><input type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"></th>
                                        <th scope="col"><input type="text" class="form-control" placeholder="Format" aria-label="Username" aria-describedby="basic-addon1"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- <th scope="row">1</th> -->
                                        <td><small class="small-text">04.03.2024 15:00</small></td>
                                        <td><small class="small-text">Adding riddles and puzzles to the quest ENG GD M2L4</small></td>
                                        <td><small class="small-text">Game Development</small></td>
                                        <td><small class="small-text">NVH_GD65_MON_OFF 3:00 PM - 4:30 PMPreferred Language: ENG</small></td>
                                        <td><small class="small-text">4</small></td>

                                        <td><small class="btn-sm btn-primary" aria-disabled="true">Offfline</small></td>
                                      
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>
