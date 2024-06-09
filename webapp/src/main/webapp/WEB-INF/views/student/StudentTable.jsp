<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="student" items="${students}">
<tr>
	<td>
      <small class="small-text"> <a
        href="${pageContext.request.contextPath}/student/detail/${student.id}"
        style="text-decoration: none; color: rgb(25, 0, 255)"
        >${student.firstName}</a
      ></small>
    </td>
   	<td><small class="small-text">${student.age}</small></td>
     <td><small class="small-text"><a href="${pageContext.request.contextPath}/group/detail?id=${student.groupId}">${student.groupTitle}</a></small></td>
     <td><small class="small-text">${student.description}</small></td>
     <td><small class="small-text"><a href="${pageContext.request.contextPath}/user/detail?id=${student.teacherId}">${student.teacherName}</a></small></td>
     <td><small class="small-text"><a href="${pageContext.servletContext.contextPath}/subpage/details-course?courseId=${student.courseId}">${student.courseName}</a></small></td>
   <!-- Add other columns as needed -->
</tr>
</c:forEach>