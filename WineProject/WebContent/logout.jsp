<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>
<html>
    <head><title>�n�X</title></head>
    <body>
    <%  
        if(session.getAttribute("access")=="y"  ) {
            session.invalidate() ;
            out.println("�z�w���\�n�X�@!! <br>") ; 
            out.println("<a href='login.jsp'> �n�J</a>") ; 
        }else{            
            response.sendRedirect("login.jsp") ; 
        }
     %>
    </body>
</html>
