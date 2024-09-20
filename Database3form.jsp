<%-- 
    Document   : Database3form
    Created on : 19-Sep-2024, 11:14:42 pm
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
        <div class="logo"><a href="Database3form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
        String level = request.getParameter("hard");
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
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Database3form.jsp");
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
        <h2>Database - Hard</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p><br>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 28px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="hard" value="Hard">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Database">  <!-- change the name and value-->
            <div class="question">
                <h3>1] What is a "serializable" isolation level in databases?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">Ensures transactions are executed sequentially</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">Prevents dirty reads but allows non-repeatable reads</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">Guarantees strict two-phase locking</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">Prevents all concurrency issues including phantom reads</label>
                    <div class="hidden" data-answer="d"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] In database indexing, what does a "bitmap index" optimize for?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">High-cardinality columns</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">Low-cardinality columns</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">Full-text searches</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">Range queries on large datasets</label>
                    <div class="hidden" data-answer="b"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] What is the main advantage of using a "clustered index" in a relational database?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">It stores data rows in a heap structure</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">It allows multiple indexes per table</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">It sorts and stores data rows in order of the index</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">It improves non-sequential data retrieval performance</label>
                    <div class="hidden" data-answer="c"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] Which data structure is typically used in relational databases to implement a B-tree index?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">Red-Black Tree</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">Hash Table</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">AVL Tree</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">Self-balancing B-tree</label>
                    <div class="hidden" data-answer="d"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] What is the primary difference between OLTP and OLAP systems?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">OLTP focuses on transactional data; OLAP on analytical data</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">OLAP handles real-time data; OLTP handles historical data</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">OLAP requires normalization; OLTP uses denormalization</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">OLTP handles aggregate queries; OLAP handles transactional updates</label>
                    <div class="hidden" data-answer="a"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] What is a "deadlock" in the context of database transactions?</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">A situation where two or more transactions wait indefinitely for each other to release resources</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">A state where a transaction is aborted due to a system crash</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">A concurrency issue where inconsistent data is read by a transaction</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">A performance bottleneck caused by locks held for too long</label>
                    <div class="hidden" data-answer="a"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] What does the term "ACID" in databases stand for?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">Atomicity, Consistency, Isolation, Durability</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">Automation, Concurrency, Indexing, Data Integrity</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">Allocation, Compression, Indexing, Durability</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">Asynchronous, Consistency, Integrity, Distribution</label>
                    <div class="hidden" data-answer="a"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] In a distributed database system, what is the purpose of the "two-phase commit" protocol?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">To ensure that all nodes agree on the outcome of a transaction</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">To improve the performance of transactions by splitting them into two phases</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">To optimize the database locking mechanism for concurrent transactions</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">To handle distributed deadlocks and prevent transaction failures</label>
                    <div class="hidden" data-answer="a"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] What is the primary purpose of "sharding" in a NoSQL database?</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">To improve the availability of the database</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">To horizontally partition data across multiple servers</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">To optimize query performance by pre-aggregating data</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">To replicate data for fault tolerance</label>
                    <div class="hidden" data-answer="b"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] What does the term "eventual consistency" mean in a distributed database system?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">All replicas will converge to the same state eventually</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">Data is always consistent across all nodes</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">Consistency is guaranteed only during write operations</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">The system will never become inconsistent, even during failure</label>
                    <div class="hidden" data-answer="a"></div>
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
