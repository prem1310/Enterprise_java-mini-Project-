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
            background-color: #f0f0f0; 
            color: #333333; 
            background-image: url('img1.png');
            background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
            height: 150vh;
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
            background-color: #333333; 
            color: white;
            display: grid;
            grid-template-columns: repeat(3, 1fr); 
            padding: 50px;
            gap: 30px;
            text-align: center;
        }

        footer ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        footer ul li {
            margin: 10px 0;
            font-size: 16px;
        }

        .bold {
            font-weight: bold;
            font-size: 18px;
            color: white;
            margin-bottom: 15px;
        }

        footer ul li a {
            color: rgb(189, 182, 182);
            text-decoration: none;
        }

        footer ul li a:hover {
            color: white;
            text-decoration: underline;
        }

        .container7 {
            margin-top: 30px;
            color: white;
            text-align: center;
            background-color: #333333;
            padding: 20px;
        }

        .container7 ul{
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .container7 input[type="email"] {
            width: 300px;
            padding: 10px;
            border: 1px solid greenyellow;
            border-radius: 5px;
            margin-right: 10px;
        }

        .container7 input[type="submit"] {
            padding: 10px 20px;
            background-color: orange;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .container7 input[type="submit"]:hover {
            background-color: darkorange;
        }

        .container7 hr {
            border: 0;
            height: 1px;
            background: white;
            margin: 20px auto;
            width: 80%;
        }

        @media (max-width: 768px) {
            footer {
                grid-template-columns: 1fr; 
            }
        }

        .container7 p {
            font-size: 18px;
            color: white;
        }

        @media (max-width: 500px) {
            .container7 input[type="email"] {
                width: 100%;
                margin-bottom: 10px;
            }
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
                <option value="General Knowledge">General Knowledge</option>
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
                    out.print("<br><center><table border='1' width='95%' style='text-align:center'");
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
                    out.print("</table></center><br><br>");
                }
                catch(Exception e){
                    out.print("<center><h3> Error: "+e+"</h3></center>");
                }
            }
            else{}
        %>
    <center>
	<div class="container7">
            <ul>
                <li class="bold">Newsletter</li>
                <li>
                    <input type="email" id="email" name="email" placeholder="Email Address">
                    <input type="submit" id="submit" value="Subscribe">
                </li>
                <li></li>
            </ul><br><br>
	    <hr>
	    <p align="center">Categories</p>
            <hr>
        </div>
    <footer>
        <div class="container1">
            <ul>
                <li class="bold">Verbal Reasoning</li>
                <li><a href="Verbal1form.jsp">Easy</a></li>
                <li><a href="Verbal2form.jsp">Intermediate</a></li>
                <li><a href="Verbal3form.jsp">Hard</a></li>
            </ul>
        </div>
        <div class="container2">
            <ul>
                <li class="bold">Arithmetic Aptitude</li>
                <li><a href="Arithmetic1form.jsp">Easy</a></li>
                <li><a href="Arithmetic2form.jsp">Intermediate</a></li>
                <li><a href="Arithmetic3form.jsp">Hard</a></li>
            </ul>
        </div>
        <div class="container3">
            <ul>
                <li class="bold">Non Verbal Reasoning</li>
                <li><a href="NonVerbal1form.jsp">Easy</a></li>
                <li><a href="NonVerbal2form.jsp">Intermediate</a></li>
                <li><a href="NonVerbal3form.jsp">Hard</a></li>
            </ul>
        </div>
	<div class="container4">
            <ul>
                <li class="bold">Civil Engineering</li>
                <li><a href="Civil1form.jsp">Easy</a></li>
                <li><a href="Civil2form.jsp">Intermediate</a></li>
                <li><a href="Civil3form.jsp">Hard</a></li>
            </ul>
        </div>
        <div class="container5">
            <ul>
                <li class="bold">General Knowledge</li>
                <li><a href="General1form.jsp">Easy</a></li>
                <li><a href="General2form.jsp">Intermediate</a></li>
                <li><a href="General3form.jsp">Hard</a></li>
            </ul>
        </div>
        <div class="container6">
            <ul>
                <li class="bold">Database</li>
                <li><a href="Database1form.jsp">Easy</a></li>
                <li><a href="Database2form.jsp">Intermediate</a></li>
                <li><a href="Database3form.jsp">Hard</a></li>
            </ul>
        </div>
    </footer>
    </center>
</body>
</html>
