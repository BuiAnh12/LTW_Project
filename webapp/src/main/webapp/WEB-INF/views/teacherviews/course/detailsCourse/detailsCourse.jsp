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
    <style><%@include file="/WEB-INF/views/course/detailsCourse/style.css"%></style>
    <base href="${pageContext.servletContext.contextPath}/">
    <title>Create Student</title>
</head>

<body>
	<div class="d-flex" id="wrapper">
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h2 class="fs-2 m-0">TeacherDetail course</h2>
				</div>

<<<<<<< HEAD
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
=======
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Teacher's detailed courses</h2>
                </div>
>>>>>>> 94943c7ea2abae1c952cb7c73b655d903fbb218f

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle second-text fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <i class="fas fa-user me-2"></i>John
								Doe
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Logout</a></li>
							</ul></li>
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
							<form:form method="POST"
								action="${pageContext.servletContext.contextPath}/manager/update-course?courseId=${courseObject.courseId}"
								modelAttribute="courseObject">
								<div class="row mb-3">
									<div class="col-6">
										<span class="fw-bold">Name</span> <input name="courseName"
											type="text" class="form-control" placeholder="Name"
											aria-label="Username" aria-describedby="basic-addon1"
											value="${courseObject.courseName}" required>
									</div>
									<div class="col-6">
										<span class="fw-bold">Description</span> <input
											name="description" type="text" class="form-control"
											placeholder="Description" aria-label="Username"
											aria-describedby="basic-addon1"
											value="${courseObject.description}" required>
									</div>
								</div>

								<div class="container mt-5">
									<!-- <h2>Thêm bài học</h2>
									<div class="mb-3">
										<label for="lessonName" class="form-label">Tên bài học</label>
										<input type="text" class="form-control" id="lessonName">
									</div>
									<button type="button"
										class="btn-sm btn-outline-primary fw-bold" id="addLessonBtn">Tạo</button>
 -->
									<h2 class="mt-5">Danh sách bài học</h2>
									<table class="table table-bordered" id="lessonsTable">
										<thead>
											<tr>
												<th>Tên bài học</th>
												<th class="hidden-column">Lesson ID</th>
												<th class="hidden-column">Status</th>
												<!-- <th>Hành động</th> -->
											</tr>
										</thead>
										<tbody>
											<!-- Table rows will be populated by JavaScript -->

											<c:forEach var="lesson" items="${courseObject.lessons}">
												<c:if test="${lesson.status == 'true'}">
													<tr class="lesson-row">
														<td>${lesson.detail}</td>
														<td class="hidden-column">${lesson.lessonId}</td>
														<%-- <td class="hidden-column">${lesson.status}</td> --%>
														<!-- <td>
												                <button type="button" class="btn btn-sm btn-danger">Xóa</button>
												            </td> -->
													</tr>
												</c:if>
											</c:forEach>


										</tbody>
									</table>
								</div>

								<!-- <div class="row mx-2 justify-content-center">
									<button type="submit" class="custom-button submit-button">Submit</button>
									<button type="button" class="custom-button delete-button"
										onclick="handleDelete()">Delete</button>
									<a href="category/course" class="custom-button return-button">Return</a>
								</div> -->

								<!-- Input ẩn để lưu danh sách bài học -->
								<div name="lessons" id="lessonsHiddenInputs">
									<!-- Hidden inputs will be populated by JavaScript -->
								</div>
							</form:form>


							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
							<script>
						        document.addEventListener("DOMContentLoaded", function () {
						            const addLessonBtn = document.getElementById('addLessonBtn');
						            const lessonsTable = document.getElementById('lessonsTable').getElementsByTagName('tbody')[0];
						            const lessonsHiddenInputs = document.getElementById('lessonsHiddenInputs');
						            function updateHiddenInputs() {
									    const rows = lessonsTable.rows;
									    lessonsHiddenInputs.innerHTML = ''; // Clear existing hidden inputs to avoid duplicates
									
									    for (let i = 0; i < rows.length; i++) {
									        (function(i) {
									            const detail = rows[i].cells[0].textContent.trim();
									            const lessonId = rows[i].cells[1].textContent.trim();
									            const status = rows[i].cells[2].textContent.trim();

									            // Tạo các input ẩn để gửi dữ liệu bài học
									            const hiddenInputDetail = document.createElement('input');
									            hiddenInputDetail.type = 'hidden';
									            hiddenInputDetail.name = 'lessons[' + i + '].detail'; // Thay đổi ở đây
									            hiddenInputDetail.value = detail;
									            lessonsHiddenInputs.appendChild(hiddenInputDetail);

									            const hiddenInputId = document.createElement('input');
									            hiddenInputId.type = 'hidden';
									            hiddenInputId.name = 'lessons[' + i + '].lessonId'; // Thay đổi ở đây
									            hiddenInputId.value = lessonId;
									            lessonsHiddenInputs.appendChild(hiddenInputId);

									            const hiddenInputStatus = document.createElement('input');
									            hiddenInputStatus.type = 'hidden';
									            hiddenInputStatus.name = 'lessons[' + i + '].status'; // Thay đổi ở đây
									            hiddenInputStatus.value = status;
									            lessonsHiddenInputs.appendChild(hiddenInputStatus);
									        })(i);
									    }

									}

						
						            function addLesson(detail, lessonId = '', status = 'true') {
						                const newRow = lessonsTable.insertRow();
						                newRow.setAttribute('data-lesson-id', lessonId);
						                newRow.setAttribute('data-status', status);
						
						                const cellDetail = newRow.insertCell(0);
						                const cellLessonId = newRow.insertCell(1);
						                const cellStatus = newRow.insertCell(2);
						                const cellAction = newRow.insertCell(3);
						
						                cellDetail.textContent = detail;
						                cellLessonId.textContent = lessonId;
						                cellLessonId.classList.add('hidden-column');
						                cellStatus.textContent = status;
						                cellStatus.classList.add('hidden-column');
						
						                const deleteButton = document.createElement('button');
						                deleteButton.textContent = 'Xóa';
						                deleteButton.className = 'btn btn-sm btn-danger';
						                deleteButton.onclick = function () {
						                    const row = this.parentNode.parentNode;
						                    lessonsTable.removeChild(row);
						                    updateHiddenInputs();
						                };
						                cellAction.appendChild(deleteButton);
						
						                updateHiddenInputs(); // Update hidden inputs after adding new lesson
						            }
						
						            const existingLessons = document.querySelectorAll('#lessonsTable tbody tr');
						            existingLessons.forEach(function (row) {
						                const detail = row.querySelector('td:nth-child(1)').textContent.trim();
						                const lessonId = row.querySelector('td:nth-child(2)').textContent.trim();
						                const status = row.querySelector('td:nth-child(3)').textContent.trim();
						                addLesson(detail, lessonId, status);
						                row.remove(); // Remove the original row to avoid duplication
						            });
						
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
            var url = "manager/course-list-active-btn";
            var params = "courseId=" + courseId;
            
            var xhr = new XMLHttpRequest();
            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    window.location.href = "category/course";
                }
            };          
            xhr.send(params);
        }
    }
</script>
</body>
</html>