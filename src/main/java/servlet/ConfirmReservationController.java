package servlet;

import dao.ReservationDAO;
import model.Reservation;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ConfirmReservationController")
public class ConfirmReservationController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Reservation r = (Reservation) session.getAttribute("reservation");

        if (r == null) {
            response.sendRedirect("book.jsp");
            return;
        }

        ReservationDAO reservationDAO = new ReservationDAO();
        boolean success = reservationDAO.addReservation(r);

        if (success) {
            request.setAttribute("successMessage", "✅ Reservation confirmed successfully!");
            session.removeAttribute("reservation");
            session.removeAttribute("room");
        } else {
            request.setAttribute("errorMessage", "❌ Failed to confirm reservation. Please try again.");
        }

        request.getRequestDispatcher("reservationSummary.jsp").forward(request, response);
        //response.sendRedirect("index.jsp");

    }
}

