<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
		<%
		String email=request.getParameter("email");
		String password =request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		
		if (password.equals("admin") && email.equals("admin123@gmail.com")) {
			response.sendRedirect("admin_homepage.html");
	        
	    } else {
	        out.println("wrong details entered");
	    }
		
		%>	
					
		
</body>
</html>