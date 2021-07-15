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

		 ps=con.prepareStatement("update placement set round1=? , round2=? , round3=? where pid=? ");
			
			String pid=request.getParameter("pid");
			String r1= request.getParameter("m1");
			String r2= request.getParameter("m2");
			String r3= request.getParameter("m3");
         
		if(pid==null||pid.equals("")||r1==null||r1.equals("")||r2==null||r2.equals("")|r3==null||r3.equals("")) {


out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>ALL THE FIELDS SHOULD BE FILLED</center></b><br/></h1>");	
				return;
			}
		int m1=Integer.parseInt(r1);
		int m2=Integer.parseInt(r2);
		int m3=Integer.parseInt(r3);
		ps.setInt(1,m1);
		ps.setInt(2,m2);
		ps.setInt(3,m3);
		ps.setString(4,pid);
	 int a=ps.executeUpdate();
	 
	if(a==1){
		
	out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>Successfully updated !!!</center></b><br/></h1>");
			out.println("</center>");
	}
	else{
		out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>INVALID PLACEMENT ID</center></b><br/></h1>");
			out.println("</center>");
	}
		
		
	 }
	catch(Exception e){
out.println("<h2<font face='Imprint MT Shadow' color='black'>>Unable to the process the request try after some time</h2>");
	}//catch
%>

</body>
</html>