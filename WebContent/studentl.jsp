<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>

<body background="j.jpg">
<%   Connection con;
	 PreparedStatement ps;
	 	Class.forName("com.mysql.jdbc.Driver");  
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
			response.setContentType("text/html");
			
	 response.setContentType("text/html");
	 try {

		 ps=con.prepareStatement("select uname,pass from student where uname=? and pass=?");
			
			String uname=request.getParameter("uname");
			String pass= request.getParameter("password");
      
		if(uname==null||uname.equals("")||pass==null||pass.equals("")) {


out.println("<h1><b><center><br><br><br><br><br><br><br><br>UserName or Password cannot be empty</center></b><br/></h1>");
				
				return;
			}
		ps.setString(1,request.getParameter("uname"));
		ps.setString(2,request.getParameter("password"));
		ResultSet rs=ps.executeQuery();
		
		if (rs.next()){
			 
			RequestDispatcher myDispatch = request.getRequestDispatcher("student.html");
			myDispatch.forward(request, response);
			
		}
		else{
		out.println("<h1><b><center><br><br><br><br><br><br><font face='arial'> INCORRECT PASSWORD<br> <br>OR <br></center></b><br/></h1>");
		out.println("<h1><b><center><pre><font face='arial'>              YOU HAVE NOT REGISTERED !! PLEASE REGISTER.... </font></pre> </center></b><br/></h1>");
		}
		
		
	 }
	catch(Exception e){
out.println("<h2>Unable to the process the request try after some time</h2>");
	}//catch
%>


</body>
</html>