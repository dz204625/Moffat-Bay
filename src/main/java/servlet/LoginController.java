package servlet;

import dao.CustomerDAO;
import model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.validateLogin(email, password);

        String redirect = request.getParameter("redirect");

        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", customer);
            session.setAttribute("customerId", customer.getCustomerId());
            session.setAttribute("customerEmail", customer.getEmail());
            session.setAttribute("customerFirstName", customer.getFirstName()); 
            session.setAttribute("customerLastName", customer.getLastName());
            session.setAttribute("phone", customer.getPhone());

            if (redirect != null && !redirect.isEmpty()) {
                response.sendRedirect(redirect);
            } else {
                response.sendRedirect("profile.jsp");
            }
        }
    }
}
