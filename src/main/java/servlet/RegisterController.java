package servlet;

import dao.CustomerDAO;
import model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer c = new Customer();
        c.setFirstName(request.getParameter("firstName"));
        c.setLastName(request.getParameter("lastName"));
        c.setEmail(request.getParameter("email"));
        c.setPhone(request.getParameter("phone"));
        c.setPasswordHash(request.getParameter("password"));

        CustomerDAO dao = new CustomerDAO();
        if (dao.registerCustomer(c)) {
            response.sendRedirect("login.jsp?msg=registered");
        } else {
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
