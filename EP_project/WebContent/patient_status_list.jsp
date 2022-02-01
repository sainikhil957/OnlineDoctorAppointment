<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Status List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<div class="w3-top">
    <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
      <a href="patient_homepage.jsp" class="w3-bar-item w3-button">back</a>
      
      <!-- Right-sided navbar links. Hide them on small screens -->
      <div class="w3-right w3-hide-small">
        <a href="index.html" class="w3-bar-item w3-button">Logout</a>
        
        </div>
    </div>
    </div>
    
   <div class="p-1 mb-2  text-dark" style="text-align:center; background-color: deepskyblue; margin-top: 100px; margin-left:400px; margin-right:400px;"><h2>PATIENT STATUS LIST</h2></div>
    
	<table class="table table-hover " style="margin-top: 100px; margin-left:250px; width: 1000px;">
		<thead>
		    <tr>
		      <th scope="col">name</th>
		      <th scope="col">Gender</th>
		      <th scope="col">Email</th>
		      <th scope="col">Age</th>
		      <th scope="col">phonenumber</th>
		      <th scope="col">Blood group</th>
		      <th scope="col">Address</th>
		      <th scope="col">Problem</th>
		      <th scope="col">Timing</th>
		      <th scope="col">Status</th>
		    </tr>
		</thead>
  		<tbody>
	    <%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
	        System.out.println("Driver Loaded");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	        System.out.println("connected to database");
		 	//PreparedStatement stmt=con.prepareStatement("select * from patient_appointment where gender=male");
		 	String sql="select  * from  patient_appointment";
            PreparedStatement pstmt=con.prepareStatement(sql);
		 	ResultSet rs=pstmt.executeQuery();
		 	
			while(rs.next())
			{
	  	%>
					  	<tr>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("gender")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("age")%></td>
							<td><%=rs.getString("phonenumber")%></td>
						   	<td><%=rs.getString("bloodgroup")%></td>
						   	<td><%=rs.getString("address")%></td>
						   	<td><%=rs.getString("problem")%></td>
						   	<td><%=rs.getString("timing")%></td>
							<%
						   		String status=rs.getString("status");
						   		System.out.println(status);
						   		if(status.equals("not booked"))
						   		{
						   	%>
						   			<td style="background-color: red"><%=rs.getString("status")%></td>
						   	<%
						   		}
						   		else
						   		{
						   	%>
						   			<td style="background-color: green"><%=rs.getString("status")%></td>
						   	<%
						   		}
						   	%>
						</tr>
			<%
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

			%>
  </tbody>
</table>
</body>
</html>