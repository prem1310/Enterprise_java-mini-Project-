<%-- 
    Document   : Verbal3form
    Created on : 09-Jul-2024, 5:58:18 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,java.util.Date"%>
<%@page import="java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verbal Reasoning</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="logo"><a href="Verbal3form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
        <a href="HomePage.jsp" class="quiz-button">Back</a>
    </header>
    <%
        String score = request.getParameter("score");
        //String username = (String) request.getAttribute("username");
        String count;
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
        DateFormat df = new SimpleDateFormat();
        Date t = Calendar.getInstance().getTime();
        String d = df.format(t);
        String testtype = request.getParameter("testtype");
        String timetaken =request.getParameter("timetaken");
        //out.println("<center><h3><b>"+username+"</b></h3></center>");
        if(a1!=null&&a2!=null&&a3!=null&&a4!=null&&a5!=null&&a6!=null&&a7!=null&&a8!=null&&a9!=null&&a10!=null&&username!=null&&score!=null&&level!=null&&d!=null&&testtype!=null){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejproject","root","root");
                count = "1";
                if(count.equals("1")){
                    PreparedStatement ps = con.prepareStatement("insert into resultdatas values(?,?,?,?,?,?,?)");
                    ps.setString(1, username);
                    ps.setString(2,ans);
                    ps.setString(3, score);
                    ps.setString(4, d);
                    ps.setString(5, testtype);
                    ps.setString(6, level);
                    ps.setString(7, timetaken);
                    ps.executeUpdate();
                    out.println("<center><h3>Your result stored successfully</h3></center>");
                    RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
                    rd.forward(request, response);
                }
                else {
                    out.println("<center><h3>You have already submited the result Or Error in storing data</h3></center>");
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Verbal3form.jsp");
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
    <h2>Verbal Reasoning - Hard</h2>
    <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p>
    <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 30px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="hard" value="Hard"> <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Verbal Reasoning">  <!-- change the value-->

        <div class="question">
            <h3>1] Choose the most appropriate synonym for "obfuscate".</h3>
            <div class="options">
                <input type="radio" id="q1a" name="q1" value="a">
                <label for="q1a">Clarify</label>
                <input type="radio" id="q1b" name="q1" value="b">
                <label for="q1b">Confuse</label>
                <input type="radio" id="q1c" name="q1" value="c">
                <label for="q1c">Illuminate</label>
                <input type="radio" id="q1d" name="q1" value="d">
                <label for="q1d">Simplify</label>
                <div class="hidden" data-answer="b"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: "Confuse" is the most appropriate synonym for "obfuscate".</div>
                <div class="result" id="result-q1"></div>
            </div>
        </div>

        <div class="question">
            <h3>2] Identify the logical relationship: "Fungi : Mushrooms :: Bryophytes : _____"</h3>
            <div class="options">
                <input type="radio" id="q2a" name="q2" value="a">
                <label for="q2a">Algae</label>
                <input type="radio" id="q2b" name="q2" value="b">
                <label for="q2b">Mosses</label>
                <input type="radio" id="q2c" name="q2" value="c">
                <label for="q2c">Ferns</label>
                <input type="radio" id="q2d" name="q2" value="d">
                <label for="q2d">Conifers</label>
                <div class="hidden" data-answer="b"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: "Mosses" is the correct analogy for Bryophytes.</div>
                <div class="result" id="result-q2"></div>
            </div>
        </div>

        <div class="question">
            <h3>3] What is the antonym of "vindicate"?</h3>
            <div class="options">
                <input type="radio" id="q3a" name="q3" value="a">
                <label for="q3a">Accuse</label>
                <input type="radio" id="q3b" name="q3" value="b">
                <label for="q3b">Defend</label>
                <input type="radio" id="q3c" name="q3" value="c">
                <label for="q3c">Justify</label>
                <input type="radio" id="q3d" name="q3" value="d">
                <label for="q3d">Exonerate</label>
                <div class="hidden" data-answer="a"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: "Accuse" is the antonym of "vindicate".</div>
                <div class="result" id="result-q3"></div>
            </div>
        </div>

        <div class="question">
            <h3>4] Complete the series: 5, 9, 17, 33, _____?</h3>
            <div class="options">
                <input type="radio" id="q4a" name="q4" value="a">
                <label for="q4a">45</label>
                <input type="radio" id="q4b" name="q4" value="b">
                <label for="q4b">57</label>
                <input type="radio" id="q4c" name="q4" value="c">
                <label for="q4c">65</label>
                <input type="radio" id="q4d" name="q4" value="d">
                <label for="q4d">71</label>
                <div class="hidden" data-answer="c"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: 65 follows the pattern of the series.</div>
                <div class="result" id="result-q4"></div>
            </div>
        </div>

        <div class="question">
            <h3>5] Find the word that is least similar to the others: Protagonist, Antagonist, Hero, Villain</h3>
            <div class="options">
                <input type="radio" id="q5a" name="q5" value="a">
                <label for="q5a">Protagonist</label>
                <input type="radio" id="q5b" name="q5" value="b">
                <label for="q5b">Hero</label>
                <input type="radio" id="q5c" name="q5" value="c">
                <label for="q5c">Villain</label>
                <input type="radio" id="q5d" name="q5" value="d">
                <label for="q5d">Antagonist</label>
                <div class="hidden" data-answer="b"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: "Hero" is least similar as the others can be oppositional in context.</div>
                <div class="result" id="result-q5"></div>
            </div>
        </div>

        <div class="question">
            <h3>6] Which of the following is a palindrome?</h3>
            <div class="options">
                <input type="radio" id="q6a" name="q6" value="a">
                <label for="q6a">Radar</label>
                <input type="radio" id="q6b" name="q6" value="b">
                <label for="q6b">Hello</label>
                <input type="radio" id="q6c" name="q6" value="c">
                <label for="q6c">World</label>
                <input type="radio" id="q6d" name="q6" value="d">
                <label for="q6d">Level</label>
                <div class="hidden" data-answer="d"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: "Level" is a palindrome.</div>
                <div class="result" id="result-q6"></div>
            </div>
        </div>
        
        <div class="question">
            <h3>7] Identify the correct sequence of the given words: <br>1. Report 2. Investigate 3. Arrest 4. Crime 5. Trial</h3>
            <div class="options">
                <input type="radio" id="q7a" name="q7" value="a">
                <label for="q7a">4, 2, 3, 1, 5</label>
                <input type="radio" id="q7b" name="q7" value="b">
                <label for="q7b">1, 4, 2, 3, 5</label>
                <input type="radio" id="q7c" name="q7" value="c">
                <label for="q7c">4, 3, 2, 1, 5</label>
                <input type="radio" id="q7d" name="q7" value="d">
                <label for="q7d">2, 4, 3, 5, 1</label>
                <div class="hidden" data-answer="a"></div>
                <div class="description hidden" style="color:#ff3333">Correct sequence: 4. Crime, 2. Investigate, 3. Arrest, 1. Report, 5. Trial.</div>
                <div class="result" id="result-q7"></div>
            </div>
        </div>

        <div class="question">
            <h3>8] Find the odd one out:</h3>
            <div class="options">
                <input type="radio" id="q8a" name="q8" value="a">
                <label for="q8a">Triangle</label>
                <input type="radio" id="q8b" name="q8" value="b">
                <label for="q8b">Circle</label>
                <input type="radio" id="q8c" name="q8" value="c">
                <label for="q8c">Rectangle</label>
                <input type="radio" id="q8d" name="q8" value="d">
                <label for="q8d">Square</label>
                <div class="hidden" data-answer="b"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: Circle is the odd one out as it does not have any straight edges, unlike the other shapes.</div>
                <div class="result" id="result-q8"></div>
            </div>
        </div>

        <div class="question">
            <h3>9] Complete the analogy: Pen is to Write as Knife is to _____.</h3>
            <div class="options">
                <input type="radio" id="q9a" name="q9" value="a">
                <label for="q9a">Cut</label>
                <input type="radio" id="q9b" name="q9" value="b">
                <label for="q9b">Stab</label>
                <input type="radio" id="q9c" name="q9" value="c">
                <label for="q9c">Sharpen</label>
                <input type="radio" id="q9d" name="q9" value="d">
                <label for="q9d">Pierce</label>
                <div class="hidden" data-answer="a"></div>
                <div class="description hidden" style="color:#ff3333">Correct answer: Cut is the primary function of a knife, just as writing is the primary function of a pen.</div>
                <div class="result" id="result-q9"></div>
            </div>
        </div>

        <div class="question">
            <h3>10] Identify the correct sequence of the given events: <br>1. Birth 2. Marriage 3. Education 4. Job 5. Retirement</h3>
            <div class="options">
                <input type="radio" id="q10a" name="q10" value="a">
                <label for="q10a">1, 3, 2, 4, 5</label>
                <input type="radio" id="q10b" name="q10" value="b">
                <label for="q10b">1, 2, 3, 4, 5</label>
                <input type="radio" id="q10c" name="q10" value="c">
                <label for="q10c">3, 1, 2, 4, 5</label>
                <input type="radio" id="q10d" name="q10" value="d">
                <label for="q10d">1, 3, 4, 2, 5</label>
                <div class="hidden" data-answer="a"></div>
                <div class="description hidden" style="color:#ff3333">Correct sequence: 1. Birth, 3. Education, 2. Marriage, 4. Job, 5. Retirement.</div>
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
