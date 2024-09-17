import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RegServlet"})
public class RegServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname").trim();
        String uemail = request.getParameter("uemail").trim();
        String pass = request.getParameter("pass").trim();
        String cpass = request.getParameter("pass1").trim();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");
            PreparedStatement ps1 = con.prepareStatement("select*from regtable where username = ?");
            ps1.setString(1, uname);
            ResultSet rs = ps1.executeQuery();
            if(rs.next()){
                out.print("<center><p><span style='font-size:15px; font-family:Tahoma, Geneva, Verdana, sans-serif; align:center;'>This "+uname+" username already taken please try another usernmae!!</span></p></center>");
                RequestDispatcher rd1 = request.getRequestDispatcher("/RegPage.jsp");
                rd1.include(request, response);
            }
            else if(cpass.equals(pass)){
                try (PreparedStatement ps = con.prepareStatement("insert into regtable values(?,?,?,?)")) {
                    ps.setString(1, uname);
                    ps.setString(2, uemail);
                    ps.setString(3, pass);
                    ps.setString(4, cpass);
                    ps.executeUpdate();
                    out.println("<center><h3><b>Registration successful welcome "+uname+"</b></h3></center>");
                    RequestDispatcher rd2 = request.getRequestDispatcher("/LoginPage.jsp");
                    rd2.forward(request, response);
                }
                con.close();
            }
            else{
                out.print("<center><p><span style='font-size:15px; font-family:Tahoma, Geneva, Verdana, sans-serif; align:center;'>Error wrong cridentials!!</span></p></center>");
                RequestDispatcher rd3 = request.getRequestDispatcher("/RegPage.jsp");
                rd3.include(request, response);
            }
        }
        catch(Exception e){
            out.println("<h3>Error:</h3> "+e);
        }
    }
}
