package dao;

import model.Reservation;
import util.DBUtil;

import java.sql.*;
import java.time.LocalDate;

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
}
