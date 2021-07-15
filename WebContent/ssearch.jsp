<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result</title>
</head>
<body background="w.jpg">
<%   Connection con;
	 PreparedStatement ps;
	 	Class.forName("com.mysql.jdbc.Driver");  
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
			response.setContentType("text/html");	
	 response.setContentType("text/html");
	 try {

		 ps=con.prepareStatement("select rstatus from student s,results r where sid=? and s.pid=r.pid ;");
			
			String sid=request.getParameter("sid");
			
      
		if(sid==null||sid.equals("")) {


out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>STUDENT ID IS EMPTY</center></b><br/></h1>");
				
				return;
			}
		ps.setString(1,request.getParameter("sid"));
		
		ResultSet rs=ps.executeQuery();
		
		if (rs.next()){
			
			 if(rs.getString(1).equals ("notselected"))
				{
				 RequestDispatcher myDispatch = request.getRequestDispatcher("failure.html");
					myDispatch.forward(request,response);
					return;
				}
			 
			RequestDispatcher myDispatch = request.getRequestDispatcher("success.html");
			myDispatch.forward(request,response);
			
		}
		
	
			else 
		{
			out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>INVALID STUDENT ID</center></b><br/></h1>");
			out.println("</center>");
		}
		 
		
	 }
	catch(Exception e){
out.println("<h2><font face='Imprint MT Shadow' color='black'>Unable to the process the request try after some time</h2>");
	}//catch
%>

</body>
</html>