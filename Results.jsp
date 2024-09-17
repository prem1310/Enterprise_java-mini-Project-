<%-- 
    Document   : Results
    Created on : 09-Jul-2024, 12:05:53 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results - AptiGuru</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* Light background color */
            color: #333333; /* Dark text color */
        }
        header h1 {
            background-color: #333333;
            color: #f0f0f0;
        }
        
        header {
            background-color: #333333; /* Dark header background */
            padding: 20px 0;
            text-align: center;
            position: relative;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: bold;
            position: relative;
        }

        nav ul li a::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: transparent;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover::after {
            background-color: #FFD700; /* Gold color for hover effect */
        }

        .back {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            background-color: #1F1F1D; 
            color: #FFFFFF;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back:hover {
            background-color: #504741; 
        }

        main h1 {
            text-align: center;
            color: #333333;
            padding: 10px ;
        }

        form {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        form label {
            margin-right: 5px;
        }

        form select, form button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .logo a {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            height: 25px;
            color: #bfbfbf;
            font-style: oblique;
            border: 1px solid #bfbfbf;
            border-radius: 80px;
            padding: 5px;
            text-decoration: none;
        }
        
        footer {
            position: relative;
            top: 326px;
            background-color: #333333; 
            color: #FFFFFF;
            text-align: center;
            padding: 20px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo"><a href="Results.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
        <nav>
            <ul>
                <li><a href="HomePage.jsp">Home</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </nav>
        <a href="HomePage.jsp" class="back">Back</a>
    </header>

    <main>
        <h1>RESULT</h1>
        <hr>
        <form >
            <label>Select Test Type:</label>
            <select id="test-type" name="test-type">
                <option value="Selectoption">Select Your Option</option>
                <option value="Verbal Reasoning">Verbal Reasoning</option>
                <option value="Arithmetic Aptitude">Arithmetic Aptitude</option>
                <option value="Nonverbal Reasoning">Nonverbal Reasoning</option>
                <option value="Civil Engineering">Civil Engineering</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Database">Database</option>
            </select>

            <label>Select Level:</label>
            <select id="level" name="level">
                <option value="selectoption">Select Your Option</option>
                <option value="Easy">Easy</option>
                <option value="Intermediate">Intermediate</option>
                <option value="Hard">Hard</option>
            </select>

            <button type="submit">Submit</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 EJ team. All rights reserved.</p>
    </footer>
   <% 
            session = request.getSession();
            String username = (String) session.getAttribute("username");
            String ttype = request.getParameter("test-type");
            String tlevel = request.getParameter("level");
    
            if(ttype!=null&&tlevel!=null){
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");
                    PreparedStatement ps = con.prepareStatement("select * from resultdatas where username=? and level=? and test_type=? ");
                    ps.setString(1,username);
                    ps.setString(2,tlevel);
                    ps.setString(3,ttype);
                    ResultSet rs = ps.executeQuery();
                    out.print("<center><table border='1' width='95%' style='text-align:center'");
                    out.print("<tr>");
                        out.print("<th>Username</th>");
                        out.print("<th>Answers</th>");
                        out.print("<th>Score</th>");
                        out.print("<th>Date & Time</th>");
                        out.print("<th>Test Type</th>");
                        out.print("<th>Test Level</th>");
                        out.print("<th>Time Taken</th>");
                    out.print("</tr>");
                    while(rs.next()){
                        out.print("<tr>");
                            out.print("<td>"+rs.getNString(1)+"</td>");
                            out.print("<td>"+rs.getNString(2)+"</td>");
                            out.print("<td>"+rs.getInt(3)+"</td>");
                            out.print("<td>"+rs.getNString(4)+"</td>");
                            out.print("<td>"+rs.getNString(5)+"</td>");
                            out.print("<td>"+rs.getNString(6)+"</td>");
                            out.print("<td>"+rs.getNString(7)+"</td>");
                        out.print("</tr>");
                    }
                    out.print("</table></center>");
                }
                catch(Exception e){
                    out.print("<center><h3> Error: "+e+"</h3></center>");
                }
            }
            else{}
        %>
    
</body>
</html>
