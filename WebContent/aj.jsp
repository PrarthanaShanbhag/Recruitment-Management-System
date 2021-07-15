<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add jobs</title>

</head>
<body background="w.jpg">
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html"); 
String pid=request.getParameter("pid");
String jobid=request.getParameter("jobid");
if(pid==null||jobid.equals("")) {
out.println("<h1><b><center><br><br><br><br><br><br><br><br>Placement ID or Job ID cannot be empty</center></b><br/></h1>");
				return;
			}
CallableStatement st=con.prepareCall("{call UPDATEJOB(?,?)}");
st.setString(1,jobid);
st.setString(2,pid);
int a=st.executeUpdate();
if(a==1){
	out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1> JOB IS ASSIGNED SUCCESSFULLY</h1></center>");

}
}
catch(Exception e)
{
	out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1> JOB ID CANNOT BE ASSIGNED</h1></center>");

}	%>

</body>
</html>