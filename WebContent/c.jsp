<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add college</title>

</head>
<body background="w.jpg">
<%  try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbmsmini","root","root");	
response.setContentType("text/html"); 
String cid=request.getParameter("cid");
String cname=request.getParameter("cname");
String address=request.getParameter("address");
String region=request.getParameter("reg");
String ph=request.getParameter("phone");

if(cname==null||address.equals("")||cid==null||region.equals("")||ph.equals("")) {


	out.println("<h1><b><center><br><br><br><br><br><br><br><br><font face='Imprint MT Shadow' color='black'>ALL THE FEILDS SHOULD BE FILLED</center></b><br/></h1>");
				
				return;
			}

PreparedStatement st=con.prepareStatement("insert into college values (?,?,?,?,?)");
st.setString(1,cid);
st.setString(2,cname);
st.setString(3,address);
st.setString(4,region);
st.setString(5,ph);

st.executeUpdate();
out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>COLLEGE IS ADDED SUCCESSFULLY</h1></center>");
}
catch(Exception e)
{
	out.println("<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>COLLEGE CANNOT BE ADDED</h1></center>");

}	%>

</body>
</html>