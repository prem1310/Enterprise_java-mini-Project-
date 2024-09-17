<%-- 
    Document   : Verbal2form
    Created on : 09-Jul-2024, 4:27:56 pm
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
        <div class="logo"><a href="Verbal2form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
        <h1>Welcome to AptiGuru</h1>
        <a href="HomePage.jsp" class="quiz-button">Back</a>
    </header>
    <%
        String score = request.getParameter("score");
        //String username = (String) request.getAttribute("username");
        int count = 0;
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
                count = 1;
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
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Verbal2form.jsp");
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
        <h2>Verbal Reasoning - Intermediate</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p>
        <!--<form action="Verbal2Servlet" method="post" id="quizForm"class=" form-container ">-->
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 30px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="inter" value="Intermediate">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Verbal Reasoning"> <!-- change the name and value-->
            <div class="question">
                <h3>1] What is the most appropriate synonym for "verbose"?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">Concise</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">Talkative</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">Succinct</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">Reserved</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Talkative. "Verbose" means using more words than needed, similar to being talkative.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] Select the correct analogy: Meteor is to Weather as Historian is to _____.</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">Future</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">Past</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">Event</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">Science</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Past. A meteor is related to weather, just as a historian is related to the past.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] Identify the most accurate synonym for "antiquated".</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">Modern</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">Obsolete</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">Innovative</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">Up-to-date</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Obsolete. "Antiquated" means outdated or no longer in use, similar to "obsolete."</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] Which term is the opposite of "intransigent"?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">Flexible</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">Stubborn</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">Unyielding</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">Dogmatic</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Flexible. "Intransigent" means unwilling to change, while "flexible" means willing to adapt.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] Choose the most fitting word to complete the sentence: The diplomat's _____ approach helped resolve the conflict.</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">Abrasive</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">Tactful</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">Confrontational</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">Aggressive</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Tactful. "Tactful" means handling matters with sensitivity and diplomacy.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] Find the word that does not fit: Orchestra, Conductor, Symphony, Manuscript</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">Orchestra</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">Conductor</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">Symphony</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">Manuscript</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Manuscript. The other options are related to music and orchestras, while "Manuscript" is not.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] Arrange the following in a logical sequence: 1. Seed 2. Plant 3. Growth 4. Fruit 5. Flower</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">1, 2, 3, 5, 4</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">1, 2, 5, 3, 4</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">1, 2, 5, 4, 3</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">1, 3, 2, 5, 4</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 1, 2, 3, 5, 4. The logical sequence for a plant's life cycle is Seed → Plant → Growth → Flower → Fruit.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] Choose the most appropriate antonym for "benevolent".</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">Generous</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">Kind</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">Malevolent</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">Charitable</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Malevolent. "Benevolent" means showing kindness, while "malevolent" means having ill will.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] Identify the term that is least related to the rest: 1. Deft 2. Skillful 3. Inept 4. Proficient</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">Deft</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">Skillful</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">Inept</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">Proficient</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Inept. The other terms (Deft, Skillful, Proficient) describe someone with skills, while "inept" describes a lack of skill.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] Arrange the following in the correct sequence: 1. Input 2. Processing 3. Output 4. Feedback</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">1, 2, 3, 4</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">2, 1, 4, 3</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">1, 3, 2, 4</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">1, 4, 2, 3</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 1, 2, 3, 4. The logical sequence for a system is Input → Processing → Output → Feedback.</div>
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
