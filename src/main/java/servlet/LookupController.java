package servlet;

import dao.ReservationDAO;
import model.Reservation;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/LookupController")
public class LookupController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        ReservationDAO dao = new ReservationDAO();
        // try numeric id first
        if (search != null && !search.isBlank()) {
        	 List<Reservation> list = dao.findReservationByIdOrEmail(search);
             request.setAttribute("reservations", list);
        }
        RequestDispatcher rd = request.getRequestDispatcher("lookUp.jsp");
        rd.forward(request, response);
    }
}