<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register</title>
<link rel="stylesheet" href="style2.css">

</head>
<body background="w.jpg">
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html"); 
String sid=request.getParameter("sid");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String lname=request.getParameter("lname");
String email=request.getParameter("mail");
String ph=request.getParameter("phone");
String address=request.getParameter("address");
String cid=request.getParameter("cid");
String perc=request.getParameter("per");
String uname=request.getParameter("uname");
String pass=request.getParameter("password");

float per=Float.parseFloat(perc);
PreparedStatement st=con.prepareStatement("insert into student (sid,fname,mname,lname,email,phone,address,cid,per,uname,pass)values (?,?,?,?,?,?,?,?,?,?,?)");
st.setString(1,sid);
st.setString(2,fname);
st.setString(3,mname);
st.setString(4,lname);
st.setString(5,email);
st.setString(6,ph);
st.setString(7,address);
st.setString(8,cid);
st.setFloat(9,per);
st.setString(10,uname);
st.setString(11,pass);

st.executeUpdate();
out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>REGISTRATION IS DONE SUCCESSFULLY</h1></center>");
}
catch(Exception e)
{
	out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>FIELDS CANNOT BE EMPTY </h1></center>");

}	%>

</body>
</html>