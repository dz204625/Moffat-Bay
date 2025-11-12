package model;

import java.math.BigDecimal;

public class Room {
    //private int roomId;
    private String room_type;
    private BigDecimal price_per_night;
    private String room_details;

    // getters / setters
    //public int getRoomId() { return roomId; }
    //public void setRoomId(int roomId) { this.roomId = roomId; }
    public String getRoomType() { return room_type; }
    public void setRoomType(String roomType) { this.room_type = roomType; }
    public BigDecimal getPricePerNight() { return price_per_night; }
    public void setPricePerNight(BigDecimal pricePerNight) { this.price_per_night = pricePerNight; }
    public String getRoomDescription() { return room_details; }
    public void setRoomDescription(String roomDescription) { this.room_details = roomDescription; }
}
