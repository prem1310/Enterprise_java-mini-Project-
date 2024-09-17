<%-- 
    Document   : Arithmetic2form
    Created on : 01-Sep-2024, 1:42:58 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,java.util.Date"%>
<%@page import="java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Arithmetic Aptitude</title>
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        <header>
            <div class="logo"><a href="Arithmetic2form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
                        ps.setString(2, ans);
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
                        RequestDispatcher rd1 = request.getRequestDispatcher("/Arithmetic2form.jsp");
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
        <h2>Arithmetic Aptitude - Intermediate</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 30px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="inter" value="Intermediate">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Arithmetic Aptitude">  <!-- change the name and value-->

            <div class="question">
                <h3>1] A train travels 120 km at a uniform speed. If the speed had been 10 km/h faster, it would have taken 30 minutes less.
                    What is the original speed of the train?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">40 km/h</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">30 km/h</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">50 km/h</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">60 km/h</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 40 km/h. Explanation: By setting up equations based 
                        on time = distance/speed, the original speed is calculated to be 40 km/h.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] A man can row 9 km/hr in still water. If the river is flowing at 3 km/hr,
                    it takes him 6 hours to row to a place and come back. How far is the place?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">24 km</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">27 km</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">30 km</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">36 km</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 27 km. Explanation: 
                        The effective speed downstream is 12 km/h and upstream is 6 km/h. Using time = distance/speed, the distance is calculated.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] A sum of money at simple interest amounts to Rs. 800 in 3 years and Rs. 920 in 4 years. What is the principal amount?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">Rs. 600</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">Rs. 640</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">Rs. 700</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">Rs. 750</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 700. Explanation: The difference of Rs. 
                        120 over 1 year is the interest for 1 year, allowing us to calculate the principal using the simple interest formula.</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] Two pipes A and B can fill a tank in 20 minutes and 30 minutes, respectively. 
                    If both are opened simultaneously, how long will it take to fill the tank?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">12 minutes</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">15 minutes</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">10 minutes</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">18 minutes</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 12 minutes. Explanation: 
                        The combined rate of the two pipes is the sum of their individual rates, resulting in 12 minutes to fill the tank.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] A man bought an article for Rs. 500 and sold it at a loss of 10%. What is the selling price of the article?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">Rs. 450</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">Rs. 460</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">Rs. 475</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">Rs. 490</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 450. Explanation: 10% of Rs. 500 is Rs. 50, 
                        so the selling price is Rs. 500 - Rs. 50 = Rs. 450.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] A shopkeeper marks an article at Rs. 800 and allows a discount of 10%. What is the selling price?</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">Rs. 720</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">Rs. 730</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">Rs. 740</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">Rs. 750</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 720. Explanation: 
                        The discount is 10% of Rs. 800, which is Rs. 80. Therefore, the selling price is Rs. 800 - Rs. 80 = Rs. 720.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] If 3x + 5 = 17, what is the value of x?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">2</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">3</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">4</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">5</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 4. Explanation: Solving the equation 3x + 5 = 17,
                        we get 3x = 12, and x = 4.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] The ratio of two numbers is 3:4, and their LCM is 180. What is the sum of the numbers?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">45</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">60</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">75</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">90</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 75. Explanation: If the numbers are 3x and 4x,
                        then their product is 12x². Given that their LCM is 180, solving for x gives us the numbers, and their sum is 75.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] A person covers a distance of 200 meters in 24 seconds. What is his speed in km/h?</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">30 km/h</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">28.8 km/h</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">32 km/h</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">36 km/h</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 28.8 km/h. Explanation: Speed = Distance/Time. 
                        Converting the speed into km/h, we get 28.8 km/h.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] The price of an article is reduced by 20%. If the original price was Rs. 250, what is the new price?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">Rs. 190</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">Rs. 200</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">Rs. 210</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">Rs. 220</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 200. Explanation: 20% of Rs. 250 is Rs. 50. 
                        So, the new price is Rs. 250 - Rs. 50 = Rs. 200.</div>
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
