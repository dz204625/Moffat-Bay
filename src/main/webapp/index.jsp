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

    <!-- Hero Section -->
    <section class="hero">
        <h3>Escape to Moffat Bay Lodge — your peaceful retreat on the edge of wilderness and waterfront. Enjoy breathtaking views, cozy accommodations, and the warmth of Pacific Northwest hospitality.</h3>
        <p>Experience tranquility, adventure, and comfort — all in one unforgettable stay.</p>
        <button class="btn-orange" onclick="location.href='book.jsp'">Book Now</button>
    </section>
    
    <section>
    	<%
		    RoomDAO dao = new RoomDAO();
		    List<Room> rooms = dao.getAllRooms();
		%>
		
    			<div class="room-list">
		<h2>Check Out Some of Our Rooms</h2>
		    <%
		        if (rooms != null && !rooms.isEmpty()) {
		            for (Room room : rooms) {
		                request.setAttribute("room", room);   // Pass room to child JSP
		    %>
		
		                <jsp:include page="room.jsp" />
		
		    <%
		            }
		        } else {
		    %>
		
		        <p>No rooms available at this time.</p>
		
		    <%
		        }
		    %>	
		</div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="feature-item">
            <img class="image-placeholder" src="./images/salish_salmon.gif" alt="Salish Salmon" />
        </div>
        <div class="feature-item">
            <h3>Amenities</h3>
            <ul>
                <li>Complimentary breakfast featuring local ingredients</li>
				<li>Free high-speed Wi-Fi across the property</li>
				<li>Private waterfront decks with panoramic bay views</li>
				<li>Cozy fireplaces and luxury bedding</li>
				<li>On-site dining and full-service bar</li>
            </ul>
        </div>
        <div class="feature-item">
            <h3>Features</h3>
            <ul>
                <li>Eco-friendly lodge designed with sustainability in mind</li>
				<li>Guided nature tours and kayak excursions</li>
				<li>Pet-friendly cabins and family suites</li>
				<li>Seasonal spa services and outdoor hot tubs</li>
				<li>Easy access to nearby hiking and fishing spots</li>

            </ul>
        </div>
        <div class="feature-item">
            <h3>Attractions</h3>
            <ul>
                <li>Whale-watching tours departing daily from the marina</li>
				<li>Moffat Bay Nature Reserve and Scenic Lookout</li>
				<li>Coastal Trail with stunning sunset views</li>
				<li>Local art galleries, breweries, and farmers markets</li>
				<li>Historical lighthouse and museum within 10 minutes</li>
            </ul>
            <button class="btn-orange" onclick="location.href='attractions.jsp'">View More</button>
        </div>
    </section>

    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
