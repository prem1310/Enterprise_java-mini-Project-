<%-- 
    Document   : HomePage
    Created on : 08-Jul-2024, 7:23:29 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Application</title>
    <link href="homecss.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <header>
        <div class="logo"><a href="HomePage.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
        <nav>
            <ul>
                <li><a href="HomePage.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="Results.jsp">Results</a></li>
            </ul>
            
        </nav>
        
        <div class="dropdown">
            <button class="dropbtn"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Profile</button>
            <div class="dropdown-content">
                <a style="background-color:#bfbfbf;">Welcome <%= session.getAttribute("username")%></a>
                <a href="deleteServlet">Delete Account</a>
                <a href="logoutServlet">Logout</a>
            </div>
        </div>
    </header>
    <h2 align="center">Categories</h2>
    <hr>
    <section class="sec-cont">
        <div class="sec" >
            <h2>Verbal Reasoning</h2>
                <button class="diff-butt e-butt"><a href="Verbal1form.jsp">Easy</a></button>
            
                <button class="diff-butt i-butt"><a href="Verbal2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt"><a href="Verbal3form.jsp">Hard</a></button>
        </div>

        <div class="sec" >
            <h2>Arithmetic Aptitude</h2>
                <button class="diff-butt e-butt"><a href="Arithmetic1form.jsp">Easy</a></button>
           
                <button class="diff-butt i-butt"><a href="Arithmetic2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt"><a href="Arithmetic3form.jsp">Hard</a></button>
        </div>

        <div class="sec" >
            <h2>Nonverbal Reasoning</h2>
                <button class="diff-butt e-butt" ><a href="NonVerbal1form.jsp">Easy</a></button>
            
                <button class="diff-butt i-butt" ><a href="NonVerbal2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt" ><a href="NonVerbal3form.jsp">Hard</a></button>
        </div>

        <div class="sec" >
            <h2>Civil Engineering</h2>
                <button class="diff-butt e-butt" ><a href="Civil1form.jsp">Easy</a></button>
            
                <button class="diff-butt i-butt" ><a href="Civil2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt" ><a href="Civil3form.jsp">Hard</a></button>
        </div>

        <div class="sec" >
            <h2>General Knowledge</h2>
                <button class="diff-butt e-butt" ><a href="General1form.jsp">Easy</a></button>
            
                <button class="diff-butt i-butt" ><a href="General2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt" ><a href="General3form.jsp">Hard</a></button>
        </div>

        <div class="sec" >
            <h2>Database</h2>
                <button class="diff-butt e-butt" ><a href="Database1form.jsp">Easy</a></button>
            
                <button class="diff-butt i-butt" ><a href="Database2form.jsp">Intermediate</a></button>
            
                <button class="diff-butt h-butt" ><a href="Database3form.jsp">Hard</a></button>
        </div>
    </section>
    <footer>
        <p>&copy; 2024 EJ team. All rights reserved.</p>
    </footer>
</body>
</html>
