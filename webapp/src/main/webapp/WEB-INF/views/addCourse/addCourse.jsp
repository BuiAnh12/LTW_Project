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
    <link rel="stylesheet" href="style.css" />
    <style><%@include file="/WEB-INF/views/addCourse/style.css"%></style>
    <title>Create Student</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <div class="bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-5 fw-bold text-uppercase border-bottom">
                <i class="fas fa-user-secret me-2"></i>CodeXpert
            </div>
            <div class="list-group list-group-flush my-3">
                <a href="index.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="schedule.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-project-diagram me-2"></i>Schedule</a>
                <a href="group.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-chart-line me-2"></i>Group</a>
                <a href="student.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-paperclip me-2"></i>Student</a>
                <a href="course.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-shopping-cart me-2"></i>Course</a>
                <a href="employees.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-gift me-2"></i>Employees</a>
                <a href="venues.html"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-map-marker-alt me-2"></i>Venues</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-comment-dots me-2"></i>Extra</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>

        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Add course</h2>
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
                <!-- COURSE -->
                <div class="table bg-white rounded">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <Span class=" text-center fw-bold" style="font-size: large;">COURSE</Span>
                            </div>
                            <!-- Form thêm khóa học và bài học -->
			<form:form method="POST" action="/manager/add-course" modelAttribute="courseObject">
			    <div class="row mb-3">
			        <div class="col-6">
			            <span class="fw-bold">Name</span>
			            <input name="courseName" type="text" class="form-control" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1" value="${courseObject.courseName}"required>
			        </div>
			        <div class="col-6">
			            <span class="fw-bold">Description</span>
			            <input name="description" type="text" class="form-control" placeholder="Description" aria-label="Username" aria-describedby="basic-addon1" value="${courseObject.description}"required>
			        </div>
			    </div>
			
			    <div class="container mt-5">
			        <h2>Thêm bài học</h2>
			        <div class="mb-3">
			            <label for="lessonName" class="form-label">Tên bài học</label>
			            <input type="text" class="form-control" id="lessonName">
			        </div>
			        <button type="button" class="btn-sm btn-outline-primary fw-bold" id="addLessonBtn">Tạo</button>
			
			        <h2 class="mt-5">Danh sách bài học</h2>
			        <table class="table table-bordered" id="lessonsTable">
			            <thead>
			                <tr>
			                    <th>Tên bài học</th>
			                    <th>Hành động</th>
			                </tr>
			            </thead>
			            <tbody>
			            </tbody>
			        </table>
			    </div>
			
			    <div class="row mx-2 justify-content-center">
			        <button type="submit" class="custom-button submit-button">Submit</button>
					<a href="/category/course" class="custom-button return-button">Return</a>

			    </div>
			    <!-- Input ẩn để lưu danh sách bài học -->
			    <div id="lessonsHiddenInputs"></div>
			</form:form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const addLessonBtn = document.getElementById('addLessonBtn');
	    const lessonsTable = document.getElementById('lessonsTable').getElementsByTagName('tbody')[0];
	    const lessonsHiddenInputs = document.getElementById('lessonsHiddenInputs');
	    const form = document.querySelector('form[modelAttribute="courseObject"]');
	
	    addLessonBtn.addEventListener('click', function () {
	        const lessonName = document.getElementById('lessonName').value;
	
	        if (lessonName.trim() === "") {
	            alert("Tên bài học không được để trống");
	            return;
	        }
	
	        const newRow = lessonsTable.insertRow();
	        const cellName = newRow.insertCell(0);
	        const cellAction = newRow.insertCell(1);
	        cellName.textContent = lessonName;
	
	        const deleteButton = document.createElement('button');
	        deleteButton.textContent = 'Xóa';
	        deleteButton.className = 'btn btn-danger';
	        deleteButton.onclick = function () {
	            lessonsTable.deleteRow(newRow.rowIndex - 1);
	            lessonsHiddenInputs.removeChild(hiddenInput); // Xóa input ẩn tương ứng
	        };
	        cellAction.appendChild(deleteButton);
	
	        // Tạo input ẩn để gửi dữ liệu bài học
	        const hiddenInput = document.createElement('input');
	        hiddenInput.type = 'hidden';
	        hiddenInput.name = 'lessons';
	        hiddenInput.value = lessonName;
	        lessonsHiddenInputs.appendChild(hiddenInput);
	
	        document.getElementById('lessonName').value = "";
	    });
	});

</script>


	<script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>

