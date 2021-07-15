<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
      <%@ page import="javax.servlet.http.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin login</title>
</head>

<body background="j.jpg">
<%  


	 response.setContentType("text/html");
	 try {
		 
			String uname=request.getParameter("uname");
			String pass= request.getParameter("password");
      
		if(uname==null||uname.equals("")||pass==null||pass.equals("")) {
out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>User Name or Password cannot be empty</center></b><br/></h1>");
				return;
			}

		if(uname.equals("admin")&& pass.equals("admin"))
		{
		
			
			RequestDispatcher myDispatch = request.getRequestDispatcher("admin.html");
			myDispatch.forward(request, response);
			
		}
		else{
		out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>INCORRECT PASSWORD  </center></b><br/></h1>");
			out.println("</center>");
		}
		
		
	 }
	catch(Exception e){
out.println("<h2><font face='Imprint MT Shadow' color='black'>Unable to the process the request try after some time</h2>");
	}//catch
	out.close();
%>


</body>
</html>