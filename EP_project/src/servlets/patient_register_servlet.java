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
 * Servlet implementation class PRegisterServlet
 */
@WebServlet("/patient_register_servlet")
public class patient_register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patient_register_servlet() {
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
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		System.out.println(name);
		System.out.println(email);
		System.out.println(phonenumber);
		System.out.println(address);
		System.out.println(password);
		
		 try {
	            Class.forName("oracle.jdbc.OracleDriver");
	            System.out.println("Driver Loaded");
	            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
	            System.out.println("connected to database");
	            
	            String sql="insert into patient_register values(?,?,?,?,?)";
	            PreparedStatement pstmt=con.prepareStatement(sql);
	            pstmt.setString(1,name);
	            pstmt.setString(2,email);
	            pstmt.setString(3,phonenumber);
	            pstmt.setString(4, address);
	            pstmt.setString(5, password);
	            ResultSet rs=pstmt.executeQuery();
	            
	            if(rs.next()) {
	            	RequestDispatcher rd=request.getRequestDispatcher("patient_signin.html");
	            	System.out.println("Register Succesfully");
	            	rd.forward(request, response);
	            }
	            else {
	            	RequestDispatcher rd=request.getRequestDispatcher("wrong_details.html");
	            	System.out.println("Register Failed");
	            	rd.forward(request, response);
	            }
	            con.close();
	        }
	        catch(Exception e){
	            System.out.println(e);
	            
	        }
	}

}
