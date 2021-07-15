<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD</title>

</head>

<body background="w.jpg">
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html"); 

String pid=request.getParameter("pid");
if(pid==null||pid.equals("")) {
out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>Placement ID cannot be empty</center></b><br/></h1>");
				return;
			}
PreparedStatement st=con.prepareStatement("insert into placement values(?,null,null,null);");
st.setString(1,pid);
int a=st.executeUpdate();
out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>ADDED PLACEMENT ID SUCCESSFULLY</h1></center>");
if(a==1){
RequestDispatcher myDispatch = request.getRequestDispatcher("pstu.html");
myDispatch.forward(request,response);
}
}
catch(Exception e)
{
	out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'> PLACEMENT ID CANNOT BE ADDED</font></h1></center>");

}	%>

</body>
</html>