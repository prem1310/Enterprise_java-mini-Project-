<%-- 
    Document   : RegPage
    Created on : 01-Jul-2024, 9:27:27 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            color: #333333;
        }

        .reg {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .reg:hover {
            text-decoration: underline;
        }

        h1 {
            background-color: #333333;
            color: #f0f0f0;
            margin: 0;
            padding: 20px 0;
            text-align: center;
        }

        header {
            background-color: #333333;
            position: relative;
        }

        .logo a{
            position: absolute;
            left: 20px; 
            top: 50%;
            transform: translateY(-50%);
            height: 25px; 
            color: #bfbfbf;
            font-style: oblique;
            border: 1px solid #bfbfbf;
            border-radius: 80px;
            padding: 5px 5px 5px 5px;
            text-decoration: none;
        }

        footer {
            background-color: #333333; 
            color: #FFFFFF;
            text-align: center;
            padding: 20px 0;
        }

        .form-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 30px;
            max-width: 400px;
            margin: 40px auto;
            text-align: left;
        }

        .form-container h2 {
            color: #333333;
            margin-bottom: 20px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-container input[type="reset"] {
            background-color: #1F1F1D;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            width: 22%;
            font-size: 14px;
            margin-right: 10px;
            transition: all ease-in-out 0.5s;
        }
        
        .form-container input[type="submit"] {
            background-color: #1F1F1D;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            width: 35%;
            justify-content: center;
            font-size: 14px;
            margin-right: 10px;
            transition: all ease-in-out 0.5s;
        }

        .form-container input[type="reset"]:hover {
            background-color: #a39c9c; 
            color: #2f2f2f;
            transition: all ease-in-out 0.5s;
            font-size: 16px;
            width: 25%
        }
        
        .form-container input[type="submit"]:hover {
            background-color: #a39c9c; 
            color: #2f2f2f;
            transition: all ease-in-out 0.5s;
            font-size: 16px;
            width: 38%
        }

        .form-container a {
            display: inline-block;
            margin-top: 10px;
            color: #007BFF;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo"><a href="RegPage.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
    </header>
    <div class="form-container">
        <form action="RegServlet" method="Post">
            <h2>Registration Page</h2>
            <hr>
            <label for="uname">UserName:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter your username" required><br>
            <label for="uemail">Email:</label>
            <input type="email" id="uemail" name="uemail" placeholder="Enter your email" required><br>
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Enter your password" required><br>
            <label for="pass1">Confirm Password:</label>
            <input type="password" id="pass1" name="pass1" placeholder="Enter your confirm password" required><br>
            <input type="submit" value="REGISTRATION">
            <input type="reset" value="RESET"><br>
            <a href="LoginPage.jsp" class="reg">Login</a>
        </form>
    </div>
    <footer>
        <p>&copy; 2024 EJ team. All rights reserved.</p>
    </footer>
</body>
</html>