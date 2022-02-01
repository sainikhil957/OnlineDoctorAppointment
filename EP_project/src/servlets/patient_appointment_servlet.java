package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class patient_appointment_servlet
 */
@WebServlet("/patient_appointment_servlet")
public class patient_appointment_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patient_appointment_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phonenumber=request.getParameter("phonenumber");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		String bloodgroup=request.getParameter("bloodgroup");
		String address=request.getParameter("address");
		String problem=request.getParameter("problem");
		String status="not booked";
		String timing=request.getParameter("timing");
		
		
		System.out.println(name);
		System.out.println(gender);
		System.out.println(email);
		System.out.println(age);
		System.out.println(phonenumber);
		System.out.println(bloodgroup);
		System.out.println(address);
		System.out.println(problem);
		System.out.println(status);
		System.out.println(timing);
		
		
		 try {
	            Class.forName("oracle.jdbc.OracleDriver");
	            System.out.println("Driver Loaded");
	            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	            System.out.println("connected to database");
	            
	            String sql="insert into patient_appointment values(?,?,?,?,?,?,?,?,?,?)";
	            System.out.println("hi");
	            PreparedStatement pstmt=con.prepareStatement(sql);
	            pstmt.setString(1,name);
	            pstmt.setString(2,email);
	            pstmt.setString(3,phonenumber);
	            pstmt.setString(4,gender);
	            pstmt.setString(5,age);
	            pstmt.setString(6,bloodgroup);
	            pstmt.setString(7, address);
	            pstmt.setString(8, problem);
	            pstmt.setString(9, status);
	            pstmt.setString(10, timing);
	            ResultSet rs=pstmt.executeQuery();
	            
	            
	            if(rs.next()) {
	            	RequestDispatcher rd=request.getRequestDispatcher("patient_appointment_success.jsp");
	            	System.out.println("Appointment Succesfully Booked");
	            	rd.forward(request, response);
	            }
	            else {
	            	RequestDispatcher rd=request.getRequestDispatcher("createfail.html");
	            	System.out.println("Appointment Failed");
	            	rd.forward(request, response);
	            }
	            con.close();
	        }
	        catch(Exception e){
	        	RequestDispatcher rd1=request.getRequestDispatcher("exception.html");
            	System.out.println("Already have a account with same  Information");
            	rd1.forward(request, response);
	            System.out.println(e);
	            
	        }
		
		
		
	}

}
