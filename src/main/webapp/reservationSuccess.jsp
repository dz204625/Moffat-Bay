<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Successful - Moffat Bay Lodge</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="success-container">
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

</body>
</html>
