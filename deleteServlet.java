import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

@WebServlet(urlPatterns = {"/deleteServlet"})
public class deleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("username");try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");
        PreparedStatement ps = con.prepareStatement("delete from regtable where username = ?");
        ps.setString(1, username);
        int rs = ps.executeUpdate();
            if(rs == 1){
                out.print("Your account deleted successfully");
                RequestDispatcher rd = request.getRequestDispatcher("/delete.jsp");
                rd.forward(request, response);
                PreparedStatement ps1 = con.prepareStatement("delete from resultdatas where username = ?");
                ps1.setString(1, username);
                ps1.executeUpdate();
            }
            else{
                out.print("<center><h3>We found some error while deleting your account pleace contact to our developer</h3></center>");
                RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
                rd.include(request, response);
            }
        }
        catch(Exception e){
            out.print("<center><h3>Error: "+e+"</h3></center>");
        }
    }
}
