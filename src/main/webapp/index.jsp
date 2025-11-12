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
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <button class="btn-orange">Book Now</button>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="feature-item">
            <div class="image-placeholder"></div>
        </div>
        <div class="feature-item">
            <h3>Amenities</h3>
            <ul>
                <li>Benefit of Feature</li>
                <li>Benefit of Feature</li>
            </ul>
        </div>
        <div class="feature-item">
            <h3>Features</h3>
            <ul>
                <li>Benefit of Feature</li>
                <li>Benefit of Feature</li>
            </ul>
        </div>
        <div class="feature-item">
            <h3>Attractions</h3>
            <ul>
                <li>Benefit of Feature</li>
                <li>Benefit of Feature</li>
            </ul>
            <button class="btn-orange small">View More</button>
        </div>
    </section>

    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
