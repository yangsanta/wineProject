<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>

<%
    if(session.getAttribute("access") != "y" ){
        out.println("您無權存取此網頁，或超過存取期限　 !!") ;           
    }else{        
        out.println("登入成功 <br>") ; 
        out.println("<b>登入者：" + 
                session.getAttribute("m_id") + "!!</b>") ; 
    }
%>
<html>
    <head><title>登入存取頁</title></head>
    <body>
    <form method="post" action="logout.jsp">
        <% if(session.getAttribute("access") == "y" ) {   %>
                 <input type="submit" value="登出" name="logout"></td>
        <%}else{%>        
        <a href="login.jsp"> 登入</a>
        <%}%>
    </form>
    </body>
</html>
