// src/model/Room.java
package model;
import java.math.BigDecimal;

public class Room {
    private int roomId;
    private String roomType;
    private BigDecimal pricePerNight;
    private String roomDetails;

    // getters / setters
    public int getRoomId() { return roomId; }
    public void setRoomId(int roomId) { this.roomId = roomId; }
    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    public BigDecimal getPricePerNight() { return pricePerNight; }
    public void setPricePerNight(BigDecimal pricePerNight) { this.pricePerNight = pricePerNight; }
    public String getRoomDescription() { return roomDetails; }
    public void setRoomDescription(String roomDescription) { this.roomDetails = roomDescription; }
}
