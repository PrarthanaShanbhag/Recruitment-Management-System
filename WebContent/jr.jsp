<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>job result</title>
<style type="text/css">
.abc{
margin-top:3%;
margin-left:10%;
}
.fff{
margin-top:-8%;
margin-left:0%;
}
</style>
</head>
<body background="uu.jpg">
<BR>
<br><div class="abc">
<br><H2>JOB BASED RESULT</H2></div>
<div class="fff">
<table border="10" width="40%" height="50%" color="black" >
			
	
			<tr>
		<TH>SLNO.</TH>
				<th>NAME</th>
				<th>POST</th>
				<th>SALARY</th>
	
			</tr>
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html"); 
String jobid=request.getParameter("jobid");
if(jobid==null) {
	RequestDispatcher myDispatch = request.getRequestDispatcher("jr2.html");
	myDispatch.forward(request, response);
				return;
			}
PreparedStatement st=con.prepareStatement("select g.pid,fname,mname,lname,post,salary from student s,gives g,job j  where s.pid=g.pid and j.job_id=g.job_id and j.job_id=?");
st.setString(1,jobid);
int i=1;
ResultSet rs=st.executeQuery();

while(rs.next()){
	
	out.println("<tr><td><center>"+i+"</td>");
	i++;
	%>
	<br><br>
	<td><center><%=rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4) %></td>
	<td><center><%=rs.getString(5) %></td>
	<td><center><%=rs.getString(6)%>pm</td>
</tr></center>

<%

}
if(!rs.previous())
{
	RequestDispatcher myDispatch = request.getRequestDispatcher("jr1.html");
	myDispatch.forward(request, response);	
}

}
catch(Exception e)
{
	RequestDispatcher myDispatch = request.getRequestDispatcher("jr1.html");
	myDispatch.forward(request, response);
	
}	%>

</body>
</html>