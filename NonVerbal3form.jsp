<%-- 
    Document   : NonVerbal3form
    Created on : 01-Sep-2024, 4:35:31 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,java.util.Date"%>
<%@page import="java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NonVerbal Reasoning</title>
    <link href="style.css" rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="logo"><a href="NonVerbal3form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
                    RequestDispatcher rd1 = request.getRequestDispatcher("/NonVerbal3form.jsp");
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
        <h2>NonVerbal Reasoning - Hard</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p><br>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 28px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="hard" value="Hard">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Nonverbal Reasoning">  <!-- change the name and value-->
            
            <div class="question">
                <h3>1] Choose the odd one out from the following shapes:</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">Circle</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">Triangle</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">Square</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">Rectangle</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Circle is the odd one out as it has no sides, unlike the other shapes.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] Find the next number in the sequence: 1, 8, 27, 64, 125, ?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">196</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">216</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">144</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">175</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 216. The sequence is the cubes of the first few natural numbers: 1^3, 2^3, 3^3, 4^3, 5^3, 6^3.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] If in a certain code language, "DREAM" is written as "CQLDL", then how is "ALERT" written in that code language?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">ZKSDQ</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">BMDPS</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">BMFUQ</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">ALWHS</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: BMDPS. The code language shifts each letter one position backward in the alphabet.</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] In a certain code language, "PENCIL" is written as "QFODMJ". How will "MARKER" be written in that code?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">NBSLFS</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">NBSLFS</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">NBSDLF</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">NBFLSF</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: NBSLFS. The code language shifts each letter one position forward in the alphabet.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] Identify the missing number in the following series: 4, 12, 36, 108, ?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">324</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">252</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">432</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">216</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 216. The pattern is each number multiplied by 3: 4×3 = 12, 12×3 = 36, 36×3 = 108, 108×2 = 216.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] Find the odd one out from the following numbers:</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">121</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">144</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">169</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">196</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 196 is not a perfect square of a prime number, whereas the others are.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] Determine the next letter in the series: A, C, F, J, O, ?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">S</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">T</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">U</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">R</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: U. The sequence adds incrementally increasing letters: A+2=C, C+3=F, F+4=J, J+5=O, O+6=U.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] Which number should replace the question mark in the series: 7, 14, 28, 56, ?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">70</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">112</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">84</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">100</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 112. The pattern multiplies each number by 2: 7×2=14, 14×2=28, 28×2=56, 56×2=112.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] Find the next shape in the series:</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">Square</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">Triangle</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">Circle</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">Hexagon</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Hexagon. The series alternates between polygons with increasing number of sides.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] Which of the following figures is the mirror image of the given figure?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">Option A</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">Option B</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">Option C</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">Option D</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Option B. It is the mirror image of the given figure.</div>
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
