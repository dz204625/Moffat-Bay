<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
		    String msg = (String) request.getAttribute("success");
		    if (msg != null) {
		%>
		    <p style="color: green;"><%= msg %></p>
		<% } %> 
		 <h2>About Moffat Bay Lodge</h2>
		    <p>Moffat Bay Lodge is a premium resort located on Joviedsa Island, part of the San Juan Islands in Washington State.</p>
		    <p>Our mission is to offer guests an unforgettable experience surrounded by pristine nature, comfort, and local culture.</p>
		 <h2>Contact Us</h2>
            <p>Phone: 365-125-4567</p>
            <p>Fax: 365-125-5678</p>
            <p>Email: <a href="mailto:stay@moffatbaylodge.com">customer@moffatbaylodge.com</a></p>    
            
            <form action="ContactController" method="post">
			    <label>Your Name:</label><br>
			    <input type="text" name="name" required><br><br>
			
			    <label>Email Address:</label><br>
			    <input type="email" name="email" required><br><br>
			
			    <label>Message:</label><br>
			    <textarea name="message" rows="5" required></textarea><br><br>
			
			    <button type="submit" class="btn-orange">Send Message</button>
			</form>

        <h4>Hours</h4>
            <p>Online Chat</p>
            <p>Mon &#8211; Fri: 9am &#8211; 6pm</p>
            <p>Sat &#8211; Sun: 10am &#8211; 4pm</p>

		<h4>Location</h4>
            <p>Moffat Bay Lodge</p>
            <p>123 Seaside Drive</p> 
            <p>Moffat Bay, WA 12345</p>
		 
	</section>


    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>