package dao;

import model.Reservation;
import util.DBUtil;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import java.math.BigDecimal;

public class ReservationDAO {

    /**
     * Check if a room is available for the desired date range.
     * Overlap check: newStart < existingEnd AND newEnd > existingStart
     */
    public boolean isRoomAvailable(int roomId, Date newCheckIn, Date newCheckOut) {
        String sql = "SELECT 1 FROM Reservation WHERE roomId = ? AND (? < checkOutDate AND ? > checkInDate) LIMIT 1";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            ps.setDate(2, new java.sql.Date(newCheckOut.getTime())); // NOTE order: condition uses values consistently
            ps.setDate(3, new java.sql.Date(newCheckIn.getTime()));
            // We used the same overlapping logic; to be explicit below use clearer mapping:
            // newCheckIn < checkOutDate AND newCheckOut > checkInDate
            // We'll rewrite with proper parameter mapping:
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Use corrected query and parameters:
        String q = "SELECT 1 FROM Reservation WHERE roomId = ? AND (? < checkOutDate AND ? > checkInDate) LIMIT 1";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(q)) {
            ps.setInt(1, roomId);
            ps.setDate(2, new java.sql.Date(newCheckIn.getTime()));
            ps.setDate(3, new java.sql.Date(newCheckOut.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                return !rs.next(); // if a row exists => NOT available => return false; otherwise true
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false; // safe default: not available on error
    }
    
    public boolean addReservation(Reservation r) {
        String sql = "INSERT INTO reservations "
                   + "(customerId, roomId, numGuests, checkInDate, checkOutDate, reservationDate, totalPrice) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, r.getCustomerId());
            stmt.setInt(2, r.getRoomId());
            stmt.setInt(3, r.getNumGuests());
            stmt.setDate(4, java.sql.Date.valueOf(r.getCheckInDate()));
            stmt.setDate(5, java.sql.Date.valueOf(r.getCheckOutDate()));
            stmt.setDate(6, java.sql.Date.valueOf(r.getReservationDate()));
            stmt.setDouble(7, r.getTotalPrice());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
