<%
    String currentPage = request.getServletPath(); 
%>

<header>
    <div class="logo"><a href="index.jsp">Moffat Bay Lodge</a></div>
<nav>
    <ul>
        <li>
            <a href="index.jsp" 
               class="<%= currentPage.endsWith("index.jsp") ? "active" : "" %>">
                Home
            </a>
        </li>

        <li>
            <a href="rooms.jsp"
               class="<%= currentPage.endsWith("rooms.jsp") ? "active" : "" %>">
                Rooms
            </a>
        </li>

        <li>
            <a href="attractions.jsp"
               class="<%= currentPage.endsWith("attractions.jsp") ? "active" : "" %>">
                Attractions
            </a>
        </li>

        <li>
            <a href="about.jsp"
               class="<%= currentPage.endsWith("about.jsp") ? "active" : "" %>">
                About
            </a>
        </li>
        <li>
            <a href="lookUp.jsp"
               class="<%= currentPage.endsWith("lookUp.jsp") ? "active" : "" %>">
                Look Up
            </a>
        </li>
        <li>
            <a href="book.jsp"
               class="<%= currentPage.endsWith("book.jsp") ? "active" : "" %>">
                Book
            </a>
        </li>

        <% 
            Integer customerId = (Integer) session.getAttribute("customerId"); 
            if (customerId == null) { 
        %>
            <li>
                <a href="login.jsp" 
                   class="<%= currentPage.endsWith("login.jsp") ? "active" : "" %>">
                    <button class="btn-orange">Log In</button>
                </a>
            </li>

        <% } else { %>

            <li>
                <a href="LogoutController"> <!-- no active state needed -->
                    <button class="btn-orange">Log Out</button>
                </a>
            </li>

            <li class="profile-icon">
                <a href="profile.jsp"
                   class="<%= currentPage.endsWith("profile.jsp") ? "active" : "" %>">
                    <i class="fa-solid fa-user"></i>
                </a>
            </li>

        <% } %>
    </ul>
</nav>

</header>
