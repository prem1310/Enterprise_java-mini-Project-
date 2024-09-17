<%-- 
    Document   : Civil3form
    Created on : 01-Sep-2024, 5:03:02 pm
    Author     : prem vishwakarma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*,java.util.Date"%>
<%@page import="java.util.Calendar,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Civil Engineering</title>
    <link href="style.css" rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="logo"><a href="Civil3form.jsp"><b>Apti<span style="color: #bfbfbf">Guru</span></b></a></div>
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
                    RequestDispatcher rd1 = request.getRequestDispatcher("/Civil3form.jsp");
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
        <h2>Civil Engineering - Hard</h2>
        <p style="color:black;" name="date">Time Started At: <%= new java.util.Date() %></p><br>
        <center><span style="font-size: 30px; font-weight: bold; color: #721c24;">Timer: </span><div id="timer" style="font-size: 28px; font-weight: bold; color: #721c24;">20:00</div></center>
        <form id="testForm">
            <input type="hidden" id="remainingTime" name="timetaken" value="">
            <input type="hidden" name="hard" value="Hard">  <!-- change the name and value-->
            <input type="hidden" name="testtype" value="Civil Engineering">  <!-- change the name and value-->
            
            <div class="question">
                <h3>1] What is the primary purpose of using a cantilever in a structure?</h3>
                <div class="options">
                    <input type="radio" id="q1a" name="q1" value="a">
                    <label for="q1a">To provide additional support to the foundation</label>
                    <input type="radio" id="q1b" name="q1" value="b">
                    <label for="q1b">To create a projecting structure without external supports</label>
                    <input type="radio" id="q1c" name="q1" value="c">
                    <label for="q1c">To enhance the aesthetic appearance of the building</label>
                    <input type="radio" id="q1d" name="q1" value="d">
                    <label for="q1d">To increase the load-bearing capacity of the columns</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To create a projecting structure without external supports. Cantilevers are used to extend outwards from a fixed point, supported only at one end.</div>
                    <div class="result" id="result-q1"></div>
                </div>
            </div>

            <div class="question">
                <h3>2] In structural engineering, what is the primary function of a diaphragm?</h3>
                <div class="options">
                    <input type="radio" id="q2a" name="q2" value="a">
                    <label for="q2a">To transfer lateral loads to the vertical load-carrying elements</label>
                    <input type="radio" id="q2b" name="q2" value="b">
                    <label for="q2b">To provide insulation against noise and temperature changes</label>
                    <input type="radio" id="q2c" name="q2" value="c">
                    <label for="q2c">To support the vertical load of the structure</label>
                    <input type="radio" id="q2d" name="q2" value="d">
                    <label for="q2d">To distribute the load equally among all structural members</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To transfer lateral loads to the vertical load-carrying elements. Diaphragms help in distributing horizontal forces such as wind and seismic loads.</div>
                    <div class="result" id="result-q2"></div>
                </div>
            </div>

            <div class="question">
                <h3>3] What is the main advantage of using prestressed concrete in construction?</h3>
                <div class="options">
                    <input type="radio" id="q3a" name="q3" value="a">
                    <label for="q3a">Increased resistance to compressive stress</label>
                    <input type="radio" id="q3b" name="q3" value="b">
                    <label for="q3b">Improved thermal insulation properties</label>
                    <input type="radio" id="q3c" name="q3" value="c">
                    <label for="q3c">Enhanced durability against chemical attacks</label>
                    <input type="radio" id="q3d" name="q3" value="d">
                    <label for="q3d">Reduced weight of structural elements</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Increased resistance to compressive stress. Prestressing concrete increases its strength and allows it to carry larger loads.</div>
                    <div class="result" id="result-q3"></div>
                </div>
            </div>

            <div class="question">
                <h3>4] In geotechnical engineering, what does the term 'settlement' refer to?</h3>
                <div class="options">
                    <input type="radio" id="q4a" name="q4" value="a">
                    <label for="q4a">The process of soil compressing under load</label>
                    <input type="radio" id="q4b" name="q4" value="b">
                    <label for="q4b">The vertical movement of soil due to changes in moisture content</label>
                    <input type="radio" id="q4c" name="q4" value="c">
                    <label for="q4c">The increase in soil volume due to freezing</label>
                    <input type="radio" id="q4d" name="q4" value="d">
                    <label for="q4d">The displacement of soil caused by seismic activity</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: The process of soil compressing under load. Settlement is a common issue in foundation design, where the soil compresses and causes the structure to sink.</div>
                    <div class="result" id="result-q4"></div>
                </div>
            </div>

            <div class="question">
                <h3>5] What is the term for a structure that supports the weight of a bridge span and transfers loads to the foundation?</h3>
                <div class="options">
                    <input type="radio" id="q5a" name="q5" value="a">
                    <label for="q5a">Pier</label>
                    <input type="radio" id="q5b" name="q5" value="b">
                    <label for="q5b">Abutment</label>
                    <input type="radio" id="q5c" name="q5" value="c">
                    <label for="q5c">Girder</label>
                    <input type="radio" id="q5d" name="q5" value="d">
                    <label for="q5d">Column</label>
                    <div class="hidden" data-answer="c"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Girder. Girders are primary horizontal structural elements that support loads and transfer them to the supports or columns.</div>
                    <div class="result" id="result-q5"></div>
                </div>
            </div>

            <div class="question">
                <h3>6] In the context of reinforced concrete, what does 'bond' refer to?</h3>
                <div class="options">
                    <input type="radio" id="q6a" name="q6" value="a">
                    <label for="q6a">The adhesive quality of concrete that helps it adhere to reinforcement bars</label>
                    <input type="radio" id="q6b" name="q6" value="b">
                    <label for="q6b">The compressive strength of concrete</label>
                    <input type="radio" id="q6c" name="q6" value="c">
                    <label for="q6c">The tensile strength of reinforcement bars</label>
                    <input type="radio" id="q6d" name="q6" value="d">
                    <label for="q6d">The overall strength of a concrete mixture</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: The adhesive quality of concrete that helps it adhere to reinforcement bars. Bond is crucial for ensuring that the concrete and reinforcement work together effectively.</div>
                    <div class="result" id="result-q6"></div>
                </div>
            </div>

            <div class="question">
                <h3>7] What is the primary purpose of using a 'damp proof course' in building construction?</h3>
                <div class="options">
                    <input type="radio" id="q7a" name="q7" value="a">
                    <label for="q7a">To prevent moisture from rising through walls and floors</label>
                    <input type="radio" id="q7b" name="q7" value="b">
                    <label for="q7b">To increase the structural load capacity of the foundation</label>
                    <input type="radio" id="q7c" name="q7" value="c">
                    <label for="q7c">To enhance the aesthetic appearance of the building</label>
                    <input type="radio" id="q7d" name="q7" value="d">
                    <label for="q7d">To provide insulation against heat loss</label>
                    <div class="hidden" data-answer="a"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To prevent moisture from rising through walls and floors. Damp proof courses are essential for protecting building materials from moisture damage.</div>
                    <div class="result" id="result-q7"></div>
                </div>
            </div>

            <div class="question">
                <h3>8] What type of structural analysis is typically used to determine the response of a structure to seismic activity?</h3>
                <div class="options">
                    <input type="radio" id="q8a" name="q8" value="a">
                    <label for="q8a">Linear Static Analysis</label>
                    <input type="radio" id="q8b" name="q8" value="b">
                    <label for="q8b">Nonlinear Dynamic Analysis</label>
                    <input type="radio" id="q8c" name="q8" value="c">
                    <label for="q8c">Modal Analysis</label>
                    <input type="radio" id="q8d" name="q8" value="d">
                    <label for="q8d">Buckling Analysis</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Nonlinear Dynamic Analysis. This method accounts for the complex behavior of structures under seismic loads, including material nonlinearity and large deformations.</div>
                    <div class="result" id="result-q8"></div>
                </div>
            </div>

            <div class="question">
                <h3>9] What is the purpose of a 'shear wall' in high-rise buildings?</h3>
                <div class="options">
                    <input type="radio" id="q9a" name="q9" value="a">
                    <label for="q9a">To provide vertical support for the building's weight</label>
                    <input type="radio" id="q9b" name="q9" value="b">
                    <label for="q9b">To resist lateral forces such as wind and seismic loads</label>
                    <input type="radio" id="q9c" name="q9" value="c">
                    <label for="q9c">To enhance the building's thermal insulation</label>
                    <input type="radio" id="q9d" name="q9" value="d">
                    <label for="q9d">To improve the aesthetic appearance of the building</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: To resist lateral forces such as wind and seismic loads. Shear walls provide essential lateral stiffness to high-rise buildings.</div>
                    <div class="result" id="result-q9"></div>
                </div>
            </div>

            <div class="question">
                <h3>10] Which material is known for its high tensile strength and is commonly used in reinforcing concrete?</h3>
                <div class="options">
                    <input type="radio" id="q10a" name="q10" value="a">
                    <label for="q10a">Aluminum</label>
                    <input type="radio" id="q10b" name="q10" value="b">
                    <label for="q10b">Steel</label>
                    <input type="radio" id="q10c" name="q10" value="c">
                    <label for="q10c">Copper</label>
                    <input type="radio" id="q10d" name="q10" value="d">
                    <label for="q10d">Plastic</label>
                    <div class="hidden" data-answer="b"></div>
                    <div class="description hidden" style="color:#ff3333">Correct answer: Steel. Steel is used in reinforced concrete due to its high tensile strength and compatibility with concrete.</div>
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
