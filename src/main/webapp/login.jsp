<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"> 
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

	<section class="wrapper">
	    <h2>Login</h2>
	    <form action="LoginController" method="post">
	        <label>Email:</label><br>
	        <input type="email" name="email" required><br>
	
	        <label>Password:</label><br>
	        <input type="password" name="password" required><br>
	
	        <button type="submit" class="btn-orange">Login</button>
	    </form>
	    <p>Don't have an account? 
		<button class="btn-orange" onclick="location.href='register.jsp'">Register Here</button>
		</p>
	</section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>



