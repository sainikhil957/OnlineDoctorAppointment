<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>home</title>
<link rel="stylesheet" type="text/css" href="index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;1,200&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   
<style>
body {
  background-image: url('patient_image1.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}
</style>
</head>

<body>

	<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
      <a href="index.html" class="w3-bar-item w3-button">Index</a>
      
      <!-- Right-sided navbar links. Hide them on small screens -->
      <div class="w3-right w3-hide-small">
        <a href="patient_appointment.html" class="w3-bar-item w3-button">Appointment</a>
        <a href="patient_status_list.jsp" class="w3-bar-item w3-button">Status</a>
        <a href="index.html" class="w3-bar-item w3-button">Logout</a>
        </div>
    </div>
    </div>
    <br><br><br>
    <% String email=request.getParameter("email"); 
    	System.out.println(email);
    %>
    <% out.println(email); %>
    
</body>
</html>
    