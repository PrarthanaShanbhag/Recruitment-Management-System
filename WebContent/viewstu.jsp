<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.abc{
margin-top:5%;
margin-left:15%;
width:100%;
}
</style>
</head>
<body background="Z.jpg">
<div class="abc">
<font color="black">

		<center><h1>STUDENTS REGISTERED</h1></center>
	</font>
	
	

	
	<br>
	<font color="black">
	<center>
	
		<table border="10" width="50%" height="120%" color="black">
			<tr>
			<th>STUDENT ID</th>
				<th>NAME</th>
				<th>COLLEGE</th>
				<th>PERCENTAGE</th>
	
			</tr>
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html");
PreparedStatement st=con.prepareStatement("select sid,fname,mname,lname,c.cname,per from student s,college c where c.cid=s.cid;");
ResultSet rs=st.executeQuery();
while(rs.next()){
%>
<tr><center>
				<td><center><%=rs.getString(1) %></td>
				<td><center><%=rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4) %></td>
				<td><center><%=rs.getString(5) %></td>
				<td><center><%=rs.getString(6) %></td>
			</tr></center>
<%}
}
catch(Exception e){
	out.println(e+"UNABLE TO PROCESS THE QUERY");
}
%>
</table>
</div>


</body>
</html>