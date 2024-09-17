
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String Uname = request.getParameter("uname");
        String Upass = request.getParameter("pass");
        //Cookie c = new Cookie("username",Uname);
        //response.addCookie(c);
        //c.setMaxAge(120);
        HttpSession session = request.getSession();
        session.setAttribute("username", Uname);
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");
            PreparedStatement ps = con.prepareStatement("select*from regtable where username = ? and cpassword = ?");
            ps.setString(1, Uname);
            ps.setString(2, Upass);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                request.setAttribute("username", Uname);
                RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
                rd.forward(request, response);
            }else{
                out.print("<h2>Error invaild cridential Login Again!!</h2>");
                RequestDispatcher rd = request.getRequestDispatcher("/LoginPage.jsp");
                rd.include(request, response);
            }
        }catch(Exception e){
            out.println("<h3>Error: </h3>"+e);
        }
    }
}
