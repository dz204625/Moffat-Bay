<%@ page import="dao.RoomDAO,model.Room,java.util.List" %>


<%
    Room room = (Room) request.getAttribute("room");
%>
 
    <div class="room-row">
        <!-- LEFT: IMAGE -->
        <div class="room-img-box">
            <img src="images/<%= room.getRoomType().toLowerCase().replace(" ","") %>.jpg"
                 alt="<%= room.getRoomType() %> Room">
        </div>

        <!-- MIDDLE: INFO -->
        <div class="room-info-box">
            <h3><%= room.getRoomType() %> Room</h3>
            <p><%= room.getRoomDescription() %></p>
        </div>

        <!-- RIGHT: PRICE + BUTTON -->
        <div class="room-action-box">
            <p class="price">$<%= room.getPricePerNight() %> / night</p>
            <button class="btn-orange" 
			        onclick="location.href='reservation.jsp?roomId=<%= room.getRoomId() %>'">
			    Book Now
			</button>
        </div>
    </div>


