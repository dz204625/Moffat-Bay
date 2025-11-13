<div class="search-container">
    <form action="rooms.jsp" method="get" class="search-form">
        <div class="form-group">
            <label for="checkin">Check in</label>
            <input type="date" id="checkin" name="checkin" required>
        </div>
        <div class="divider"></div>
        <div class="form-group">
            <label for="checkout">Check out</label>
            <input type="date" id="checkout" name="checkout" required>
        </div>
        <div class="divider"></div>
        <div class="form-group">
            <label for="guests">Rooms & guests</label>
            <select id="guests" name="guests">
                <option>1 room, 1 guest</option>
                <option>1 room, 2 guests</option>
                <option>2 rooms, 4 guests</option>
                <option>3 rooms, 6 guests</option>
            </select>
        </div>
        <button type="submit" class="btn-orange search-btn">Search</button>
    </form>
</div>