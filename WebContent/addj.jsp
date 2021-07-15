<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update marks</title>
</head>
<body background="w.jpg">
<%   Connection con;
	 PreparedStatement ps;
	 	Class.forName("com.mysql.jdbc.Driver");  
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
			response.setContentType("text/html");
			
	 response.setContentType("text/html");
	 try {

		 ps=con.prepareStatement("insert into job values(?,?,?,?) ");
			
			String jid=request.getParameter("jid");
			String post= request.getParameter("post");
			String sal= request.getParameter("sal");
			String vac= request.getParameter("vac");
         
		if(jid==null||post.equals("")||sal==null||vac.equals("")) {


out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>ALL THE FIELDS SHOULD BE FILLED</center></b><br/></h1>");	
				return;
			}
		int salary=Integer.parseInt(sal);
		int vacancy=Integer.parseInt(vac);

		ps.setString(1,jid);
		ps.setString(2,post);
		ps.setInt(3,salary);
		ps.setInt(4,vacancy);
	 int a=ps.executeUpdate();
	
	if(a==1){
		
	out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>Jobs are Successfully updated !!!</center></b><br/></h1>");
			out.println("</center>");
	}
	else{
		out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>INVALID JOB ID</center></b><br/></h1>");
			out.println("</center>");
	}
		
		
	 }
	catch(Exception e){
out.println("<h2><font face='Imprint MT Shadow' color='black'>Unable to the process the request try after some time</h2>");
	}//catch
%>

</body>
</html>