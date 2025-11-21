package servlet;

import dao.CustomerDAO;
import model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        CustomerDAO customerDAO = new CustomerDAO();
	        Customer customer = customerDAO.validateLogin(email, password);
	        
        if (customer != null) {
            // ✅ Store user info in session
            HttpSession session = request.getSession();
            session.setAttribute("user", customer);
            session.setAttribute("customerId", customer.getCustomerId()); // store customer ID
            session.setAttribute("customerName", customer.getFirstName()); // optional
            session.setAttribute("customerEmail", customer.getEmail());

            // Redirect to home or reservation page
            response.sendRedirect("reservation.jsp");
        } else {
            // Login failed
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
