<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    

<c:forEach var="schedule" items="${schedules}">
  <tr>
      <th><small class="small-text">${schedule.occurDate}</small></th>
      <td><small class="small-text"><a href="lesson/lesson/${schedule.lessonId}.htm">${schedule.nextLesson}</small></td>
      <td><small class="small-text"><a href="${pageContext.servletContext.contextPath}/subpage/details-course?courseId=${schedule.courseId}">${schedule.courseName}</small></td>
      <td><small class="small-text"><a href="group/group/${schedule.groupId}.htm">${schedule.groupTitle}</small></td>
      <td><small class="small-text"><a href="teacher/teacher/${schedule.teacherId}.htm">${schedule.teacherName}</small></td>
      <td><small class="small-text">${schedule.format}</small></td>
  </tr>
</c:forEach>

                                