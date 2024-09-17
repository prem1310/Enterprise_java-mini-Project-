<%-- 
    Document   : Verbal1form
    Created on : 03-Jul-2024, 8:42:20 pm
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
        <div class="logo"><a href="Verbal1form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
        String level = request.getParameter("easy");
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
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Verbal1form.jsp");
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
        <h2>Verbal Reasoning - Easy</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p><br>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 30px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="easy" value="Easy">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Verbal Reasoning">  <!-- change the name and value-->

            <div class="question">
                <h3>1] Arrange the words given below in a meaningful sequence.<br>1. Key 2. Door 3. Lock 4. Room 5. Switch on</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">5, 1, 2, 4, 3</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">4, 2, 1, 5, 3</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">1, 3, 2, 4, 5</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">1, 2, 3, 5, 4</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct sequence: 1. Key, 2. Lock, 3. Door, 4. Room, 5. Switch on.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] Arrange the words given below in a meaningful sequence. <br>1. Income 2. Status 3. Education 4. Well-being 5. Job</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">1, 2, 5, 3, 4</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">1, 3, 2, 5, 4</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">3, 1, 5, 2, 4</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">3, 5, 1, 2, 4</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct sequence: 3. Education, 5. Job, 1. Income, 2. Status, 4. Well-being.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] What is the synonym of "abundant"?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">Scarce</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">Plentiful</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">Sparse</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">Rare</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Plentiful is a synonym of "abundant".</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] Arrange the words given below in a meaningful sequence.<br>1. Windows 2. Walls 3. Floor 4. Foundation 5. Roof 6. Room</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">4, 1, 5, 6, 2, 3</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">4, 2, 1, 5, 3, 6</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">4, 3, 5, 6, 2, 1</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">4, 5, 3, 2, 1, 6</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct sequence: 4. Foundation, 2. Walls, 1. Windows, 5. Roof, 3. Floor, 6. Room.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] Arrange the words given below in a meaningful sequence.<br>1. Puberty 2. Adulthood 3. Childhood 4. Infancy 5. Senescence 6. Adolescence</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">2, 4, 6, 3, 1, 5</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">4, 3, 1, 6, 2, 5</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">4, 3, 6, 2, 1, 5</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">5, 6, 2, 3, 4, 1</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct sequence: 4. Infancy, 3. Childhood, 1. Puberty, 6. Adolescence, 2. Adulthood, 5. Senescence.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] Complete the analogy: Cat is to Meow as Dog is to _____.</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">Bark</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">Roar</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">Hiss</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">Chirp</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Bark is the sound a dog makes, just as meow is the sound a cat makes.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] Arrange the words given below in a meaningful sequence.<br>1. Post-box 2. Letter 3. Envelope 4. Delivery 5. Clearance</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">2, 3, 1, 4, 5</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">3, 2, 1, 5, 4</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">1, 2, 3, 4, 5</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">2, 3, 1, 5, 4</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct sequence: 2. Letter, 3. Envelope, 1. Post-box, 5. Clearance, 4. Delivery.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] Which of the following is a synonym for "enormous"?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">Tiny</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">Huge</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">Minuscule</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">Little</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Huge is a synonym for "enormous".</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] Find the antonym of "expand".</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">Increase</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">Shrink</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">Grow</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">Enlarge</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Shrink is the antonym of "expand".</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] Choose the word that does not belong: Car, Truck, Airplane, Bicycle</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">Car</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">Truck</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">Airplane</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">Bicycle</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Airplane does not belong to the group as it is the only vehicle that flies.</div>
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
