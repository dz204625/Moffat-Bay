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
	        response.sendRedirect("login.jsp?msg=Please login first");
	        return;
	 }
   Integer roomId = null;
   String firstName = (String) session.getAttribute("customerFirstName");
   String lastName = (String) session.getAttribute("customerLastName");
   String phone = (String) session.getAttribute("phone");
   String email = (String) session.getAttribute("customerEmail");

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

