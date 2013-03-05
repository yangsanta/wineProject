<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC</title>
</head>
<body>
<CENTER>
<H1>會員註冊(將會員資料寫入SQLServer資料庫)</H1>

<HR>
<Form Action="product/memberRegister" method="POST">
    <Table>
         <TR>
             <TD align="RIGHT">帳號：</TD>
             <TD align="LEFT"><input	type="text" name="m_id" value="helloSnoopy" size="20"></TD>
         </TR>
         <TR>
             <TD align="RIGHT">密碼：</TD>
             <TD align="LEFT" ><input	type="password" name="m_pwd" value="123456" size="20"></TD>
         </TR>             
         <TR>
             <TD align="RIGHT">姓名：</TD>
             <TD align="LEFT" ><input	type="text" name="m_name" value="史努比"  size="30"></TD>
         </TR>             
         <TR>
             <TD align="RIGHT">Email：</TD>
             <TD align="LEFT" ><input type="text" name="m_email" value="snoopyHello@ppp.com.tw" size="40"></TD>
         </TR>             
         <TR>
             <TD align="RIGHT">行動電話號碼：</TD>
             <TD align="LEFT" > <input type="text" name="m_mobile" value="0123456789"></TD>
         </TR>             
         <TR>
             <TD align="RIGHT">生日：</TD>
             <TD align="LEFT" > <input type="text" name="m_bday" value="2000-11-11"></TD>
         </TR>
         <TR>
             <TD align="RIGHT">通訊地址：</TD>
             <TD align="LEFT" > <input type="text" name="m_addr" value="taipei"></TD>
         </TR>    
        <TR>
            <TD colspan="2" align="center">      <input type="submit" value="送出註冊"> </TD>
            </TR>
         </Table>
</Form>
</CENTER>
</body>

</html>
