<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>

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
     
    <section>   
  		<h2>You have been logged out</h2>
    </section>


    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>