<%@ page session="true" %>

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

	<section class="wrapper">
	    <h1>Reservation Confirmed!</h1>
	    <%
	        String message = (String) request.getAttribute("message");
	        if (message != null) {
	    %>
	        <p><strong><%= message %></strong></p>
	    <%
	        }
	    %>
	</section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
