<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title> �|���C�� </title></head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3> �|���C�� </h3>	<font color=red>( MVC )</font></td></tr></table>


<h3>��Ƭd��:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<ul>
  <li><a href='listAllMem.jsp'>List</a> �|���C�� </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="mem.do" >
        <b>��Jm_no(�p1001):</b>
        <input type="text" name="m_no">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="member.model.MemberService" />
   
  <li>
     <FORM METHOD="post" ACTION="mem.do" >
       <b>���m_no:</b>
       <select size="1" name="m_no">
         <c:forEach var="memberVO" items="${memSvc.all}" > 
          <option value="${memberVO.m_no}">${memberVO.m_no}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="mem.do" >
       <b>���m_name:</b>
       <select size="1" name="m_no">
         <c:forEach var="memberVO" items="${memSvc.all}" > 
          <option value="${memberVO.m_no}">${memberVO.m_name}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
</ul>

</body>

</html>
