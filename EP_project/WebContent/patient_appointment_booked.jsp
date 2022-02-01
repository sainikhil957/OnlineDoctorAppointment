<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% String name=request.getParameter("name"); %>
	<h1><%= name %></h1>
	<% 
	try {
	            Class.forName("oracle.jdbc.OracleDriver");
	            System.out.println("Driver Loaded");
	            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	            System.out.println("connected to database");
	            
	            String sql="UPDATE patient_appointment SET STATUS = 'booked' WHERE name=?";
	            PreparedStatement pstmt=con.prepareStatement(sql);
	            pstmt.setString(1,name);
	            System.out.println(name);
	            pstmt.executeQuery();
	            response.sendRedirect("patient_appointment_accepted.html");
	            
	}
	        catch(Exception e){
	            System.out.println(e);
	            
	        }
	%>
	
</body>
</html>