<%@ page session="true" %>

<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />

	<div>
	    <h1>Reservation Confirmed!</h1>
	    <%
	        String message = (String) request.getAttribute("message");
	        if (message != null) {
	    %>
	        <p><strong><%= message %></strong></p>
	    <%
	        }
	    %>
	</div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
