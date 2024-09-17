<%-- 
    Document   : Arithmetic3form
    Created on : 01-Sep-2024, 1:52:39 pm
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
            <div class="logo"><a href="Arithmetic3form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
                        RequestDispatcher rd1 = request.getRequestDispatcher("/Arithmetic3form.jsp");
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
        <h2>Arithmetic Aptitude - Hard</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 30px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="hard" value="Hard">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Arithmetic Aptitude">  <!-- change the name and value-->

            <div class="question">
                <h3>1] Two trains, 180 meters and 120 meters long, are running at speeds of 54 km/h and 72 km/h respectively in
                    opposite directions on parallel tracks. How long will it take for them to cross each other?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">10 seconds</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">12 seconds</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">15 seconds</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">18 seconds</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 12 seconds. Explanation: 
                        Relative speed = (54 + 72) km/h = 126 km/h = 35 m/s. Combined length = 180 + 120 = 300 meters. Time = Distance/Speed = 300/25 = 12 seconds.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] A person invested Rs. 10,000 at 12% per annum compounded annually. After 3 years, what will be the amount?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">Rs. 14,048.64</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">Rs. 14,374.22</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">Rs. 14,049.60</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">Rs. 14,112.60</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 14,048.64. Explanation: 
                        Using the compound interest formula, A = P(1 + r/n)^(nt), where P = 10,000, r = 0.12, n = 1, t = 3, the amount is calculated as Rs. 14,048.64.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] A mixture contains alcohol and water in the ratio 5:3. If 16 liters of water is added to the mixture, 
                    the ratio of alcohol to water becomes 5:7. What is the quantity of alcohol in the original mixture?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">20 liters</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">22 liters</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">24 liters</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">26 liters</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 24 liters. Explanation: Let the quantity of alcohol be 5x and water be 3x. After adding water, 
                        the new ratio becomes 5x:(3x+16) = 5:7. Solving gives x = 4, so alcohol = 5x = 24 liters.</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] A shopkeeper buys an article for Rs. 1,500 and marks it up by 20%. He then allows a discount of 10% on the marked price. 
                    What is his profit percentage?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">8%</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">10%</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">12%</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">14%</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 8%. Explanation: Marked price = Rs.
                        1,500 × 1.2 = Rs. 1,800. Selling price = Rs. 1,800 × 0.9 = Rs. 1,620. Profit = Rs. 120, so profit percentage = (120/1,500) × 100 = 8%.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] A, B, and C start a business with investments in the ratio 2:3:5. After 4 months, A withdraws half his capital,
                    B doubles his capital, and C withdraws 20% of his capital. What is the share of C in the total profit of Rs. 18,000 at the end of the year?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">Rs. 7,500</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">Rs. 8,000</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">Rs. 8,500</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">Rs. 9,000</label>
                    <div class="hidden" data-answer="d"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 9,000. Explanation: 
                        Calculate the effective capital for each partner for the entire year, then determine C's share in the total profit based on his capital's contribution.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] A man borrows Rs. 20,000 at an interest rate of 15% per annum. He agrees to repay the loan in 4 equal annual installments.
                    What will be the amount of each installment?</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">Rs. 7,210</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">Rs. 7,234</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">Rs. 7,265</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">Rs. 7,280</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Rs. 7,210. Explanation:
                        Using the formula for an equated monthly installment (EMI) with annual payments, the installment is Rs. 7,210.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] The average age of a group of 5 men is increased by 2 years when one of them, aged 24, is replaced by a new man.
                    What is the age of the new man?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">30 years</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">34 years</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">36 years</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">38 years</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 36 years. Explanation:
                        Let the sum of the ages of the 5 men before the replacement be S. The new average after replacement is (S - 24 + x)/5 = previous average + 2. Solving for x gives the new man's age as 36 years.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] A and B can complete a task in 16 days and 24 days respectively. They work together for 6 days,
                    and then B leaves. In how many more days will A finish the remaining work?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">5 days</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">6 days</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">7 days</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">8 days</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 6 days. Explanation: 
                        Work done by A and B together in 6 days = 6(1/16 + 1/24) = 5/8 of the total work. Remaining work = 3/8, which A can finish in 6 days.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] A man sold two articles for Rs. 6,000 each, gaining 20% on one and losing 20% on the other.
                    What is his overall gain or loss percentage?</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">1% loss</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">2% loss</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">4% loss</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">No profit, no loss</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 4% loss. Explanation:
                        Gain and loss percentages on equal selling prices result in an overall percentage loss, calculated using the formula: loss = (loss% × gain%)/100 = 4%.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] A bag contains 5 red, 7 blue, and 3 green balls. Two balls are drawn at random.
                    What is the probability that they are both blue?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">7/45</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">1/3</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">7/66</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">2/11</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: 7/66. Explanation:
                        Total ways to choose 2 balls = 15C2 = 105. Ways to choose 2 blue balls = 7C2 = 21. So, the probability = 21/105 = 7/66.</div>
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
                document.getElementById("timer").style="font-size:45px; color: #721c24; font-weight: bold;";
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
