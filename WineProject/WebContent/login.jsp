<%@page contentType="text/html"%>
<%@page pageEncoding="MS950"%>


<html>   
  <head><title>登入會員</title></head>
<body>
<form method="post"  action = "login">
<table border="0" width="898">
    <tr>
      <td width="890" align="left" colspan="2">
       <b><font size="5">系統登入</font></b>
        <hr>
      </td>
    </tr>
    <tr>
      <td width="75" align="center">
        <p align="right">帳號：</p>
      </td>
      <td width="809" align="center">
        <p align="left">
        <input type="text" name="m_id" 
      
        size="20"></td>
    </tr>
    <tr>
      <td width="75" align="center">
        <p align="right">密碼：</p>
      </td>
      <td width="809" align="center">
        <p align="left">
        <input type="password" name="m_pwd" 
       
        size="20">
        <input type="submit" value="登入" name="loginButton"></td>
    </tr>
  </tr>
</table>
</form>
    </body>
</html>