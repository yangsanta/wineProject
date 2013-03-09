<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>
<html>
    <head><title>登出</title></head>
    <body>
    <%  
        if(session.getAttribute("access")=="y"  ) {
            session.invalidate() ;
            out.println("您已成功登出　!! <br>") ; 
            out.println("<a href='login.jsp'> 登入</a>") ; 
        }else{            
            response.sendRedirect("login.jsp") ; 
        }
     %>
    </body>
</html>
