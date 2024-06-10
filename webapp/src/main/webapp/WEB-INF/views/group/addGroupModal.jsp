<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <style><%@include file="/WEB-INF/views/group/style.css"%></style>
  <base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
    <!-- addGroupModal.jsp -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="divider" style="height: 20px;"></div>
            <h2>Add student</h2>
            <div class="modal-main-content">
                <div class="col">
                    <div class="row form-container">
                        <form action="yourActionURL" method="POST">
                            <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                <label for="title">Title:</label>
                                <input type="text" id="title" name="title" class="form-control" placeholder="Enter title">
                            </div>

                            <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                <label for="note">Note:</label>
                                <input type="text" id="note" name="note" class="form-control" placeholder="Enter note">
                            </div>
                            <div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                <label for="start-date">Start Date:</label>
                                <input type="date" id="start-date" name="start-date" class="form-control">
                            </div>
							<div class="col-md-12 form-group"
								style="padding-top: 10px; padding-bottom: 10px;">
								<label for="main-teacher">Main Teacher:</label> <select
									id="main-teacher" name="main-teacher" class="form-control">
									<option value="" selected disabled>Select Main Teacher</option>
									<c:forEach items="${teacherList}" var="teacher">
										<option value="${teacher.id}">${teacher.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-12 form-group"
								style="padding-top: 10px; padding-bottom: 10px;">
								<label for="course">Course:</label> <select id="course"
									name="course" class="form-control">
									<option value="" selected disabled>Select Course</option>
									<c:forEach items="${courseList}" var="course">
										<option value="${course.courseId}">${course.courseName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-12 form-group" style="padding-top: 10px; padding-bottom: 10px;">
                                <label for="end-date">End Date:</label>
                                <input type="date" id="end-date" name="end-date" class="form-control">
                            </div>

							<div class="col-md-12 form-group"
								style="padding-top: 10px; padding-bottom: 10px;">
								<label for="supervisor">Supervisor:</label> <select
									id="supervisor" name="supervisor" class="form-control">
									<option value="" selected disabled>Select Supervisor</option>
									<c:forEach items="${supervisorList}" var="supervisor">
										<option value="${supervisor.id}">${supervisor.name}</option>
									</c:forEach>
								</select>
							</div>

							<div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="divider" style="height: 10px;"></div>
        </div>
    </div>
</body>
</html>
