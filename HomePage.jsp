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
    <style>
        body{
            background-image: url('img1.png');
            background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
            height: 150vh;
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
            background-color: #fd7e14;
            color: #ffffff;
            font-weight: bold; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .container7 input[type="submit"]:hover {
            background-color: #e96a08;
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
            font-weight: bold; 
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
