<%@page contentType="text/html"%>
<%@page pageEncoding="Big5"%>
<html>
    <head><title>登出</title>
     <meta http-equiv="refresh" content="3;url=	<%request.getHeader("REFERER"); %>">
    </head>
    <body>
    <%  
        if(session.getAttribute("access")=="y"  ) {
            session.invalidate() ;
            out.println("您已成功登出　!! <br>") ; 
            out.println("<a href='index.jsp'> 登入</a>") ; 
        }else{            
            response.sendRedirect("login.jsp") ; 
        }
     %>
    </body>
</html>


