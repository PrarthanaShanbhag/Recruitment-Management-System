<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="ll.jpg">
<font color="black">
		<center><h1>JOBS</h1></center>
	</font>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br><br><br><br><br><br>
	
	<br>
	<font color="black">
	<center>
		<table border="10" width="50%" height="120%" color="black">
			<tr>
			<th>JOB_ID</th>
				<th>POST</th>
				<th>SALARY</th>
				<th>VACANCY</th>
	
			</tr>
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html");
PreparedStatement st=con.prepareStatement("select * from job order by job_id;");
ResultSet rs=st.executeQuery();
while(rs.next()){
%>
<tr><center>
				<td><center><%=rs.getString(1) %></td>
				<td><center><%=rs.getString(2) %></td>
				<td><center>Rs.<%=rs.getString(3) %></td>
				<td><center><%=rs.getString(4) %></td>
			</tr></center>
<%}
}
catch(Exception e){
	out.println(e+"UNABLE TO PROCESS THE QUERY");
}
%>
</table>



</body>
</html>