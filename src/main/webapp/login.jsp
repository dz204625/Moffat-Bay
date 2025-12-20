<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

	<section class="wrapper">
		<%
		    String msg = request.getParameter("msg");
		%>
		
		<% if ("registered".equals(msg)) { %>
		    <div style="color: green; font-weight: bold; margin-bottom: 15px;">
		        Registration successful! Please log in.
		    </div>
		<% } %>
		
	    <h2>Login</h2>

<form action="LoginController" method="post">
	
    <input type="email" name="email" required>
   <br>
    <input type="password" name="password" required>
   
 <br>
    <%
        String redirect = request.getParameter("redirect");
        if (redirect != null) {
    %>
        <input type="hidden" name="redirect" value="<%= redirect %>">
    <%
        }
    %>

    <button type="submit"  class="btn-orange">Log In</button>
</form>

<p>Don't have an account?
    <button class="btn-orange" onclick="location.href='register.jsp'">
        Register Here
    </button>
</p>

	</section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>



