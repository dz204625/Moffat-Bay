<%@ page import="dao.ReservationDAO, model.Reservation, dao.RoomDAO, model.Room,java.util.List" %>
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

<%
if (session.getAttribute("user") == null) {
    String roomIdParam = request.getParameter("roomId");
    String redirectUrl = "login.jsp?redirect=book.jsp";

    if (roomIdParam != null) {
        redirectUrl += "?roomId=" + roomIdParam;
    }

    response.sendRedirect(redirectUrl);
    return;
}

Integer roomId = null;
try {
    if (request.getParameter("roomId") != null) {
        roomId = Integer.parseInt(request.getParameter("roomId"));
    }
} catch (Exception e) {
    roomId = null;
}
%>


	<!-- Include reservation -->
	<jsp:include page="reservationForm.jsp" />
	
</section>
<!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>

