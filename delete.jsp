<%-- 
    Document   : delete
    Created on : 01-Sep-2024, 7:42:34 pm
    Author     : prem vishwakarma
--%>
<!-- Not In use -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AptiGuru-Error Page</title>
    </head>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; 
            color: #333333; 
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
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            position:absolute;
            bottom: 0;
            width: 100%;
        }
        
        h3{
            font-size: 35px;
            font-weight: bold;
            font-family: Times New Roman;
            text-shadow: 0 0 3px #333333 ,0 0 3px black;
        }
        p{
            font-size: 20px;
            font-weight: bold;
            font-family: Times New Roman;
        }
        input[type='email']{
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type='submit']{
            padding: 8px;
            margin: 8px 0;
            border: 1px #bfbfbf solid;
            border-radius: 10px;
            color: #333333;
            background: #bfbfbf;
            width: 5%;
            transition: all ease-in-out 0.5s;
        }
        input[type='submit']:hover{
            color:#bfbfbf;
            background: #414150;
            width: 6%;
            transition: all ease-in-out 0.5s;
        }
        .clas{
            
            font-size: 15px;
            font-family: cursive;
        }
        h4 a{
            text-decoration: none;
            color: #000000;
        }
        h4 a:hover{
            color: #333333;
            transition: ease-in-out 2s;
        }
    </style>
    <body>
        <header>
            <div class="logo"><a href="LoginPage.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
            <h1>Welcome to AptiGuru</h1>
        </header>
        
    <center>
        <h3>Create your New Account</h3>
        <p>Register yourself by clicking below link</p><br>
        <h4><a href="RegPage.jsp">Register</a></h4>
        <form method="get">
            Enter you email: <input type="email" name="email" id="email" placeholder="Enter you email" size="25px" Required />
            <br><sub>This email is only for news related mail.</sub>
            <br><br>
            <input type="checkbox" id="feedback" value="ON" onclick="check(this)" />All terms & condition's
            <br><br>
            <input type="submit" id="submit" value="SUBMIT" onclick="sub()" disabled="disabled" />
        </form>
    </center>
        <footer>
            <h4>&copy; 2024 EJ team. All rights reserved.</h4>
        </footer>
    </body>
    <script>
        let check1 = document.getElementById("feedback");
        let submit = document.getElementById("submit");
        function check(val){
            if(val.checked === true){
                submit.disabled = false;
                document.getElementById("submit").style="color:#ffffff; background:#333333;";
            }
            else{
                submit.disabled = true;
                document.getElementById("submit").style="color:#333333; background:#bfbfbf;";
            }
        }
        function sub(){ 
            let name = document.getElementById("email").value;
            alert("you "+name+" is stored successfully!");
            submit.disabled = true;
            document.getElementById("email").value = '';
            check1.checked = false;
            document.getElementById("submit").style="color:#333333; background:#bfbfbf;";
        }
    </script>
</html>
