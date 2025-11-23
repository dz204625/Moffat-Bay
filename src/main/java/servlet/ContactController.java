package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ContactController")
public class ContactController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fake mail — No email is actually sent.
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        // Just return confirmation
        request.setAttribute("success", 
            "Thank you, " + name + "! Your message has been received. " +
            "We will reply to " + email + " shortly.");

        request.getRequestDispatcher("about.jsp").forward(request, response);
    }
}
