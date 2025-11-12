package dao;

import model.Reservation;
import util.DBUtil;
import java.sql.*;
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

    public boolean saveReservation(Reservation r) {
        String sql = "INSERT INTO Reservation (customerId, roomId, numGuests, checkInDate, checkOutDate, totalPrice) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, r.getCustomerId());
            ps.setInt(2, r.getRoomId());
            ps.setInt(3, r.getNumGuests());
            ps.setDate(4, new java.sql.Date(r.getCheckInDate().getTime()));
            ps.setDate(5, new java.sql.Date(r.getCheckOutDate().getTime()));
            ps.setBigDecimal(6, r.getTotalPrice());
            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) r.setReservationId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public List<Reservation> getReservationsByEmail(String email) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT r.* FROM Reservation r JOIN Customer c ON r.customerId = c.customerId WHERE c.email = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reservation r = mapRowToReservation(rs);
                    list.add(r);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public Reservation getReservationById(int id) {
        String sql = "SELECT * FROM Reservation WHERE reservationId = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRowToReservation(rs);
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return null;
    }

    private Reservation mapRowToReservation(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.setReservationId(rs.getInt("reservationId"));
        r.setCustomerId(rs.getInt("customerId"));
        r.setRoomId(rs.getInt("roomId"));
        r.setNumGuests(rs.getInt("numGuests"));
        r.setCheckInDate(rs.getDate("checkInDate"));
        r.setCheckOutDate(rs.getDate("checkOutDate"));
        r.setTotalPrice(rs.getBigDecimal("totalPrice"));
        r.setReservationDate(rs.getTimestamp("reservationDate"));
        return r;
    }
}
