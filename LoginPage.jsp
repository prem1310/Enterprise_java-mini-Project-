<%-- 
    Document   : tempjsp
    Created on : 01-Jul-2024, 9:21:40 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* Light background color */
            color: #333333; /* Dark text color */
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
            background-color: #333333; /* Dark header background */
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
            background-color: #333333; /* Dark footer background */
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
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
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"],
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

        .form-container input[type="submit"]:hover,
        .form-container input[type="reset"]:hover {
            background-color: #a39c9c; 
            color: #2f2f2f;
            transition: all ease-in-out 0.5s;
            font-size: 16px;
            width: 25%
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
        <div class="logo"><a href="LoginPage.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
    </header>
    <div class="form-container">
        <form action="LoginServlet" method="Post">
            <h2>Login Page</h2>
            <hr>
            <label for="uname">UserName:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter your username" required><br>
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Enter your password" required><br>
            <input type="submit" value="LOGIN">
            <input type="reset" value="RESET"><br>
            <a href="RegPage.jsp" class="reg">New User/Registration</a>
        </form>
    </div>
    <footer>
        <p>&copy; 2024 EJ team. All rights reserved.</p>
    </footer>
</body>
</html>