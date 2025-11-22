<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />
     
    <section class="wrapper">
       	<h2>Please fill out the form to register here!</h2>
	  	<form action="RegisterController" method="post">
		    First Name: <input type="text" name="firstName" required><br>
		    Last Name: <input type="text" name="lastName" required><br>
		    Email: <input type="email" name="email" required><br>
		    Phone: <input type="text" name="phone"><br>
		    Password: <input type="password" name="password" required><br>
		    <button type="submit" class="btn-orange">Register</button>
		</form>
     </section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>