<header>
    <div class="logo"><a href="index.jsp">Moffat Bay Lodge</a></div>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="rooms.jsp">Rooms</a></li>
            <li><a href="attractions.jsp">Attractions</a></li>
            <li><a href="about.jsp">About</a></li>
            <% 
                Object user = session.getAttribute("user");
                if (user == null) { 
            %>
                            <li>
                <a href="login.jsp">
                    <button class="btn-orange">Log In</button>
                </a>            </li>
                
            <% 
                } else { 
            %>
                <li><a href="LogoutController">
                    <button class="btn-orange">Log Out</button>
                </a></li>
                <li class="profile-icon">
                    <a href="profile.jsp">
                        <i class="fa-solid fa-user"></i>
                    </a>
                </li>
            <% 
                } 
            %>
        </ul>
    </nav>
</header>
