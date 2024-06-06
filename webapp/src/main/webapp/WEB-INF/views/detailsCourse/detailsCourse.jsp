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
    <style><%@include file="/WEB-INF/views/detailsCourse/style.css"%></style>
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
                    <h2 class="fs-2 m-0">Detail course</h2>
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
			<form:form method="POST" action="/manager/update-course?courseId=${courseObject.courseId}" modelAttribute="courseObject">
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
			            	 <c:forEach var="lesson" items="${courseObject.lessons}">
							    <tr class="lesson-row">
							        <td>${lesson}</td>
							        <td>
							            <button type="button" class="btn btn-sm btn-danger" onclick="removeLesson(this)">Xóa</button>
							        </td>
							    </tr>
							</c:forEach>
			            </tbody>
			        </table>	
			    </div>
			
			    <div class="row mx-2 justify-content-center">
			        <button type="submit" class="custom-button submit-button">Submit</button>
			        <button type="button" class="custom-button delete-button" onclick="handleDelete()">Delete</button>			
					<a href="/category/course" class="custom-button return-button">Return</a>

			        
			    </div>
			    <!-- Input ẩn để lưu danh sách bài học -->
			    <div id="lessonsHiddenInputs">
			    	
			    </div>
			</form:form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<script>
//JavaScript
document.addEventListener("DOMContentLoaded", function () {
    const addLessonBtn = document.getElementById('addLessonBtn');
    const lessonsTable = document.getElementById('lessonsTable').getElementsByTagName('tbody')[0];
    const lessonsHiddenInputs = document.getElementById('lessonsHiddenInputs');

    function addLesson(lessonName) {
        const newRow = lessonsTable.insertRow();
        const cellName = newRow.insertCell(0);
        const cellAction = newRow.insertCell(1);
        cellName.textContent = lessonName;

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Xóa';
        deleteButton.className = 'btn btn-sm btn-danger';
        deleteButton.onclick = function () {
            // Tìm hàng chứa nút "Xóa" được nhấp vào
            const row = this.parentNode.parentNode;
            // Xóa hàng khỏi bảng
            lessonsTable.removeChild(row);
            // Xóa dữ liệu tương ứng từ danh sách ẩn
            const lessonInput = document.querySelector('input[value="' + lessonName + '"]');
            if (lessonInput) {
                lessonsHiddenInputs.removeChild(lessonInput);
            }
        };
        cellAction.appendChild(deleteButton);

        // Tạo input ẩn để gửi dữ liệu bài học
        const hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'lessons';
        hiddenInput.value = lessonName;
        lessonsHiddenInputs.appendChild(hiddenInput);
    }

    // Thêm các bài học đã có sẵn
    const existingLessons = document.querySelectorAll('#lessonsTable tbody tr td:first-child');
    existingLessons.forEach(function (lesson) {
        addLesson(lesson.textContent.trim());
    });

    // Xử lý sự kiện khi người dùng nhấn nút "Tạo"
    addLessonBtn.addEventListener('click', function () {
        const lessonName = document.getElementById('lessonName').value;

        if (lessonName.trim() === "") {
            alert("Tên bài học không được để trống");
            return;
        }

        addLesson(lessonName);
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
   <script>
    function handleDelete() {
        var confirmation = confirm("Bạn có chắc muốn xóa khóa học này không?");
        if (confirmation) {
            // Tạo một yêu cầu POST
            var courseId = "${courseObject.courseId}";
            var url = "/manager/course-list-active-btn";
            var params = "courseId=" + courseId;
            
            var xhr = new XMLHttpRequest();
            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = "/category/course";
                }
            };
            
            xhr.send(params);
        }
    }
</script>

</body>
</html>

