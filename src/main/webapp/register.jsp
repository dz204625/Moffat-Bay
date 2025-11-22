<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />
    	<%
		    String msg = request.getParameter("msg");
		    String error = request.getParameter("error");
		%>
    
    <section class="wrapper">
    	<% if ("true".equals(error)) { %>
		    <div style="color: red; font-weight: bold; margin-bottom: 15px;">
		        Invalid email or password. Please try again.
		    </div>
		<% } %>
		
       	<h2>Please fill out the form to register here!</h2>
	  	<form action="RegisterController" method="post">
		    First Name: <input type="text" name="firstName" required><br>
		    Last Name: <input type="text" name="lastName" required><br>
		    Email: <input type="email" name="email" required><br>
		    Phone: <input type="text" name="phone"><br>
		    Password: <input type="password" name="password" required
				minlength="8"
	           pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"
	           title="Must be at least 8 characters, include one uppercase letter, one lowercase letter, and one number."><br>
		    <button type="submit" class="btn-orange">Register</button>
		</form>
     </section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>