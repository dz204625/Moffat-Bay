package dao;

import model.Room;
import util.DBUtil;
import java.sql.*;
import java.util.*;
import java.math.BigDecimal;

public class RoomDAO {

    public Room getRoomById(int roomId) {
        String sql = "SELECT * FROM Room WHERE roomId = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Room r = new Room();
                    r.setRoomId(rs.getInt("roomId"));
                    r.setRoomType(rs.getString("roomType"));
                    r.setPricePerNight(rs.getBigDecimal("pricePerNight"));
                    r.setRoomDescription(rs.getString("roomDescription"));
                    return r;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Room> getAllRooms() {
        List<Room> out = new ArrayList<>();
        String sql = "SELECT * FROM room";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room r = new Room();
                //r.setRoomId(rs.getInt("roomId"));
                r.setRoomType(rs.getString("room_type"));
                r.setPricePerNight(rs.getBigDecimal("price_per_night"));
                r.setRoomDescription(rs.getString("room_details"));
                out.add(r);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return out;
    }
}

