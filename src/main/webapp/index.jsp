<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
    <section class="hero">
        <h3>Escape to Moffat Bay Lodge — your peaceful retreat on the edge of wilderness and waterfront. Enjoy breathtaking views, cozy accommodations, and the warmth of Pacific Northwest hospitality.</h3>
        <p>Experience tranquility, adventure, and comfort — all in one unforgettable stay.</p>
        <button class="btn-orange">Book Now</button>
    </section>
    
    <section>
     	<!-- Include SearchForm -->
    	<jsp:include page="searchRoom.jsp" />
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="feature-item">
            <img class="image-placeholder" src="./images/large-hotel-palm-trees-beach-thailand.jpg" alt="Palm Tree and Beach" title="Credit: Tirachard"/>
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
            <button class="btn-orange">View More</button>
        </div>
    </section>

    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
