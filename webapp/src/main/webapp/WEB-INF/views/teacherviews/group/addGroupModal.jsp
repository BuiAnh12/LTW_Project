<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
                        <form:form action="/webapp/manager/add-group" method="POST" modelAttribute="groupObject" onsubmit="return validateDate()">
                            <div class="mb-3">
                                <label for="title" class="form-label">Tiêu đề:</label>
                                <input type="text" id="title" name="title" value="${groupObject.title}" class="form-control" placeholder="Nhập tiêu đề" required>
                            </div>

                            <div class="mb-3">
                                <label for="note" class="form-label">Ghi chú:</label>
                                <input type="text" id="note" name="note" value="${groupObject.note}" class="form-control" placeholder="Nhập ghi chú" required>
                            </div>

                            <div class="mb-3">
                                <label for="start-date" class="form-label">Ngày bắt đầu:</label>
                                <input type="date" id="start-date" name="startDate" value="${groupObject.startDate}" class="form-control" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="main-teacher" class="form-label">Giáo viên chính:</label>
                                <select id="main-teacher" name="teacherId" class="form-control" required>
                                    <option value="" selected disabled>Chọn giáo viên chính</option>
                                    <c:forEach items="${teacherList}" var="teacher">
                                        <option value="${teacher.id}">${teacher.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="course" class="form-label">Khóa học:</label>
                                <select id="course" name="courseId" class="form-control" required>
                                    <option value="" selected disabled>Chọn khóa học</option>
                                    <c:forEach items="${courseList}" var="course">
                                        <option value="${course.courseId}">${course.courseName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="end-date" class="form-label">Ngày kết thúc:</label>
                                <input type="date" id="end-date" name="endDate" value="${groupObject.endDate}" class="form-control" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="supervisor" class="form-label">Giám sát:</label>
                                <select id="supervisor" name="supervisorId" class="form-control" required>
                                    <option value="" selected disabled>Chọn giám sát</option>
                                    <c:forEach items="${supervisorList}" var="supervisor">
                                        <option value="${supervisor.id}">${supervisor.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">Gửi</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="divider" style="height: 10px;"></div>
        </div>
    </div>
    <script>
    function validateDate() {
        var startDate = document.getElementById("start-date").value;
        var endDate = document.getElementById("end-date").value;

        if (endDate < startDate) {
            alert("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
