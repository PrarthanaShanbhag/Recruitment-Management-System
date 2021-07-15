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
left:10%;
}
.fff{
margin-top:-8%;
margin-left:0%;
}
</style>
</head>
<body background="co.jpg"><BR>
<BR><div class="abc">
<CENTER><H2>COLLEGE BASED RESULT</H2></CENTER></div>
<center>
	<div class="fff">
		<table border="10" width="40%" height="120%" color="black">
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
String cid=request.getParameter("cid");
if(cid==null) {
	RequestDispatcher myDispatch = request.getRequestDispatcher("cr2.html");
	myDispatch.forward(request, response);
				return;
			}
PreparedStatement st=con.prepareStatement("select fname,mname,lname,post,salary from student s,gives g,job j  where s.pid=g.pid and j.job_id=g.job_id and s.cid=?");
st.setString(1,cid);
 int i=1;
ResultSet rs=st.executeQuery();
while(rs.next()){
	
	out.println("<tr><td><center>"+i+"</td>");
	i++;
	%>
	<br><br>
	<td><center><%=rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3) %></td>
	<td><center><%=rs.getString(4) %></td>
	<td><center><%=rs.getString(5)%>pm</td>
</tr></center>

<%


}
if(!rs.previous())
{
	RequestDispatcher myDispatch = request.getRequestDispatcher("cr1.html");
	myDispatch.forward(request, response);	
}

}
catch(Exception e)
{
	out.println(e);
	RequestDispatcher myDispatch = request.getRequestDispatcher("cr1.html");
	myDispatch.forward(request, response);
	
}	%>

</body>
</html>