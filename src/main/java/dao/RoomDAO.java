package dao;

import model.Room;
import util.DBUtil;
import java.sql.*;
import java.util.*;

public class RoomDAO {

    public Room getRoomById(int roomId) {
        String sql = "SELECT * FROM room WHERE roomId = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Room r = new Room();
                    r.setRoomId(rs.getInt("roomId"));
                    r.setRoomType(rs.getString("roomType"));
                    r.setPricePerNight(rs.getBigDecimal("pricePerNight"));
                    r.setRoomDescription(rs.getString("roomDetails"));
                    return r;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public double getRoomPrice(int roomId) {
        String sql = "SELECT pricePerNight FROM room WHERE roomId = ?";
        double price = 0.0;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, roomId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                price = rs.getDouble("pricePerNight");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return price;
    }

    public List<Room> getAllRooms() {
        List<Room> out = new ArrayList<>();
        String sql = "SELECT * FROM room";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Room r = new Room();
                r.setRoomId(rs.getInt("roomId"));
                r.setRoomType(rs.getString("roomType"));
                r.setPricePerNight(rs.getBigDecimal("pricePerNight"));
                r.setRoomDescription(rs.getString("roomDetails"));
                out.add(r);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return out;
    }
}

