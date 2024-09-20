<%-- 
    Document   : Database2form
    Created on : 19-Sep-2024, 11:14:32 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,java.util.Date"%>
<%@page import="java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database</title>
    <link href="style.css" rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="logo"><a href="Database2form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
        <a href="HomePage.jsp" class="quiz-button">Back</a>
    </header>
    <%
        String score = request.getParameter("score");
        //String username = (String) request.getAttribute("username");
        //Cookie[] uname = request.getCookies();
        //String username = uname[0].getValue();
        session = request.getSession();
        String username = (String) session.getAttribute("username");
        String level = request.getParameter("inter");
        String a1=request.getParameter("q1");
        String a2=request.getParameter("q2");
        String a3=request.getParameter("q3");
        String a4=request.getParameter("q4");
        String a5=request.getParameter("q5");
        String a6=request.getParameter("q6");
        String a7=request.getParameter("q7");
        String a8=request.getParameter("q8");
        String a9=request.getParameter("q9");
        String a10=request.getParameter("q10");
        String ans="1."+a1+" 2."+a2+" 3."+a3+" 4."+a4+" 5."+a5+" 6."+a6+" 7."+a7+" 8."+a8+" 9."+a9+" 10."+a10;
        //date
        
        DateFormat df = new SimpleDateFormat();
        Date t = Calendar.getInstance().getTime();
        String d = df.format(t);
        String testtype = request.getParameter("testtype");
        String timetaken =request.getParameter("timetaken");
        //out.println("<center><h3><b>"+username+"</b></h3></center>");
        int count = 1;
        if(a1!=null&&a2!=null&&a3!=null&&a4!=null&&a5!=null&&a6!=null&&a7!=null&&a8!=null&&a9!=null&&a10!=null&&username!=null&&score!=null&&level!=null&&d!=null&&testtype!=null){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");

                if(count == 1){
                    PreparedStatement ps = con.prepareStatement("insert into resultdatas values(?,?,?,?,?,?,?)");
                    ps.setString(1, username);
                    ps.setString(2,ans);
                    ps.setString(3, score);
                    ps.setString(4, d);
                    ps.setString(5, testtype);
                    ps.setString(6, level);
                    ps.setString(7, timetaken);
                    ps.executeUpdate();
                    out.print("<center><h3>Your result stored successfully</h3></center>");
                    RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
                    rd.forward(request, response);
                    count++;
                }
                else {
                    out.print("<center><h3>You have already submited the result Or Error in storing data</h3></center>");
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Database2form.jsp");
                    rd1.include(request, response);
                }
                con.close();
            }catch(Exception e){
                out.println("Error: "+e);   
            }
        }
        else{
            out.print("<Center><h2>Fill all the questions</h2></center>");
        }
    %>
    <div class="container">
        <h2>Database - Intermediate</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p><br>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 28px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="inter" value="Intermediate">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Database">  <!-- change the name and value-->
            <div class="question">
                <h3>1] What does ACID stand for in the context of database transactions?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">Atomicity, Consistency, Isolation, Durability</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">Atomicity, Control, Isolation, Dependability</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">Accuracy, Consistency, Isolation, Durability</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">Access, Consistency, Integrity, Durability</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Atomicity, Consistency, Isolation, Durability.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] Which SQL clause is used to filter records based on a condition?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">JOIN</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">GROUP BY</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">ORDER BY</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">WHERE</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: WHERE.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] Which type of join returns only the rows that have matching values in both tables?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">LEFT JOIN</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">RIGHT JOIN</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">INNER JOIN</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">FULL JOIN</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: INNER JOIN.</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] What is the primary purpose of normalization in a database?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">To improve query performance</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">To remove redundancy and ensure data integrity</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">To increase storage space</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">To reduce CPU usage</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To remove redundancy and ensure data integrity.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] What is a foreign key in a relational database?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">A key that uniquely identifies each record</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">A key used to establish a relationship between two tables</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">A key that controls access to the database</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">A key that stores unique identifiers for each column</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: A key used to establish a relationship between two tables.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] What is the purpose of a primary key in a database?</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">To enforce a unique constraint on a column</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">To refer to a record in another table</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">To store multiple values in a column</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">To optimize search queries</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To enforce a unique constraint on a column.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] In SQL, which of the following is used to combine records from two or more tables?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">JOIN</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">MERGE</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">INSERT</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">UPDATE</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: JOIN.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] What does the SQL function COUNT() do?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">Returns the sum of a numeric column</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">Counts the number of rows that match a specified condition</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">Returns the maximum value of a column</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">Finds the average value of a column</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Counts the number of rows that match a specified condition.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] In a database, what is a "trigger"?</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">A stored procedure that is automatically invoked when a specified event occurs</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">A constraint that limits the values of a column</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">A key that is used to unlock a database</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">A method to rollback a transaction</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: A stored procedure that is automatically invoked when a specified event occurs.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] Which SQL keyword is used to fetch a unique record from a table?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">DISTINCT</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">GROUP BY</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">UNIQUE</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">ORDER BY</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: DISTINCT.</div>
                    <div class="result" id="result-q10"></div>
                </div>
            </div>

            <button type="button" class="submit-button" onclick="checkAnswers()">Submit</button>
            <div class="score" id="score"></div>
            <br>
            <center><input type="submit" value="Back & Submit The Answers"></center>
            <input type="hidden" name="score" id="hiddenScore">
        </form>
    </div>
    <footer>
        <p>&copy; 2024 EJ team. All rights reserved.</p>
    </footer>
        <script>
            function checkAnswers() {
            const questions = document.querySelectorAll('.question');
            let score = 0;
            questions.forEach((question) => {
                const options = question.querySelectorAll('input[type="radio"]');
                let selectedAnswer;
                options.forEach(option => {
                    if (option.checked) {
                        selectedAnswer = option.value;
                    }
                });

                const correctAnswer = question.querySelector('.hidden').dataset.answer;
                const description = question.querySelector('.description');
                const result = question.querySelector('.result');
                result.style.display = 'block';
                if (selectedAnswer === correctAnswer) {
                    result.textContent = 'Correct!';
                    result.classList.add('correct');
                    result.classList.remove('wrong');
                    description.style.display = 'none'; 
                    score++;
                } else {
                    result.textContent = 'Wrong!';
                    result.classList.add('wrong');
                    result.classList.remove('correct');
                    description.style.display = 'block'; 
                }
            });

                const scoreElement = document.getElementById('score');
                scoreElement.style.display = 'block';
                scoreElement.textContent = "Score: " + score + " / " + questions.length + " ";
                document.getElementById('hiddenScore').value = score;
            }
        </script>
        <!-- for timer -->
        <script>
            let duration = 20; 
            let startTime = new Date().getTime(); 
            let endTime = startTime + duration * 60 * 1000;
            let countdown = setInterval(function() {
                let now = new Date().getTime();
                let distance = endTime - now;
                let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                let seconds = Math.floor((distance % (1000 * 60)) / 1000);
                document.getElementById("timer").innerHTML = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
                document.getElementById("timer").style="font-size:28px; color: #721c24; font-weight: bold;";
                if (distance < 0) {
                    clearInterval(countdown);
                    document.getElementById("timer").innerHTML = "Time's up!";
                    document.getElementById("testForm").submit();
                }
            }, 1000);
            document.getElementById("testForm").addEventListener("submit", function() {
                let now = new Date().getTime();
                let timeTakenSeconds = Math.floor((now - startTime) / 1000); 
                let minutes = Math.floor(timeTakenSeconds / 60);
                let seconds = timeTakenSeconds % 60;
                let timeTakenFormatted = minutes + " minutes " + (seconds < 10 ? "0" : "") + seconds + " seconds";
                document.getElementById("remainingTime").value = timeTakenFormatted;
            });
        </script>
</body>
</html>
