package servlet;

import java.io.IOException;
import java.time.LocalDate;

import dao.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reservation;
import model.Room;

@WebServlet("/ReservationController")
public class ReservationController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int customerId = (Integer) session.getAttribute("customerId");

        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int numGuests = Integer.parseInt(request.getParameter("numGuests"));

        LocalDate checkInDate = LocalDate.parse(request.getParameter("checkInDate"));
        LocalDate checkOutDate = LocalDate.parse(request.getParameter("checkOutDate"));

        int nights = (int) java.time.temporal.ChronoUnit.DAYS.between(checkInDate, checkOutDate);

        // Get price per night from DAO
        RoomDAO roomDAO = new RoomDAO();
        double pricePerNight = roomDAO.getRoomPrice(roomId);
        Room room = roomDAO.getRoomById(roomId);

        double totalPrice = pricePerNight * nights;

        // Create reservation object
        Reservation reservation = new Reservation();
        reservation.setCustomerId(customerId);
        reservation.setRoomId(roomId);
        reservation.setNumGuests(numGuests);
        reservation.setCheckInDate(checkInDate);
        reservation.setCheckOutDate(checkOutDate);
        reservation.setReservationDate(LocalDate.now());
        reservation.setTotalPrice(totalPrice);

     // Attach to request
        session.setAttribute("reservation", reservation);
        session.setAttribute("room", room);
        
       // request.setAttribute("reservation", reservation);
        //request.setAttribute("room", room);

        // Forward to confirmation summary
        request.getRequestDispatcher("reservationSummary.jsp")
               .forward(request, response);
        /*
        // Save to DB
        ReservationDAO reservationDAO = new ReservationDAO();
        boolean success = reservationDAO.addReservation(reservation);

        if (success) {
            request.setAttribute("message", "Reservation successfully created!");
            request.getRequestDispatcher("reservationSuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Error saving reservation. Try again.");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
        }*/
    }
}