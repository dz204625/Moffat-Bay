package dao;

import model.Reservation;
import util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {


    public boolean addReservation(Reservation r) {
        String sql = "INSERT INTO reservation "
                   + "(customerId, roomId, numGuests, checkInDate, checkOutDate, reservationDate, totalPrice) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, r.getCustomerId());
            stmt.setInt(2, r.getRoomId());
            stmt.setInt(3, r.getNumGuests());
            stmt.setDate(4, Date.valueOf(r.getCheckInDate()));
            stmt.setDate(5, Date.valueOf(r.getCheckOutDate()));
            stmt.setDate(6, Date.valueOf(r.getReservationDate()));
            stmt.setDouble(7, r.getTotalPrice());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean isRoomReserved(int roomId, LocalDate start, LocalDate end) {
        String sql = "SELECT COUNT(*) FROM reservation "
                   + "WHERE roomId = ? AND "
                   + "(checkInDate < ? AND checkOutDate > ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, roomId);
            stmt.setDate(2, Date.valueOf(end));
            stmt.setDate(3, Date.valueOf(start));

            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getInt(1) > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();

        String sql = "SELECT * FROM reservation ORDER BY reservationId DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservationId"));
                r.setCustomerId(rs.getInt("customerId"));
                r.setRoomId(rs.getInt("roomId"));
                r.setNumGuests(rs.getInt("numGuests"));
                r.setCheckInDate(rs.getDate("checkInDate").toLocalDate());
                r.setCheckOutDate(rs.getDate("checkOutDate").toLocalDate());
                r.setReservationDate(rs.getDate("reservationDate").toLocalDate());
                r.setTotalPrice(rs.getDouble("totalPrice"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Reservation> findReservationByIdOrEmail(String input) {
        List<Reservation> list = new ArrayList<>();

        String sql =
            "SELECT r.* FROM reservation r " +
            "JOIN customer c ON r.customerId = c.customerId " +
            "WHERE r.reservationId = ? OR c.email = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Try to treat input as reservationId
            int reservationId = -1;
            try { reservationId = Integer.parseInt(input); } catch (Exception ignored) {}

            stmt.setInt(1, reservationId);
            stmt.setString(2, input);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservationId"));
                r.setCustomerId(rs.getInt("customerId"));
                r.setRoomId(rs.getInt("roomId"));
                r.setNumGuests(rs.getInt("numGuests"));
                r.setCheckInDate(rs.getDate("checkInDate").toLocalDate());
                r.setCheckOutDate(rs.getDate("checkOutDate").toLocalDate());
                r.setReservationDate(rs.getDate("reservationDate").toLocalDate());
                r.setTotalPrice(rs.getDouble("totalPrice"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
