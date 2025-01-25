package OnlineBookStore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Debug: Entry point of the servlet
        System.out.println("LogoutServlet invoked.");

        // Retrieve the current session (if it exists)
        HttpSession session = req.getSession(false);

        if (session == null) {
            // If the session is null, it means there is no active session
            System.out.println("No active session found. Possible session timeout or user already logged out.");
            req.setAttribute("msg", "Session Expired. Please log in again.<br>");
        } else {
            // If the session exists, proceed to invalidate it
            System.out.println("Active session found. Proceeding with logout.");

            // Remove user-related attributes from the session
            System.out.println("Removing session attributes: abean and alist.");
            session.removeAttribute("abean");
            session.removeAttribute("alist");

            // Invalidate the session to destroy it
            System.out.println("Invalidating the session.");
            session.invalidate();
            System.out.println("Session invalidated successfully.");

            // Set a success message to display on the next page
            req.setAttribute("msg", "Logged out successfully.<br>");
        }

        // Forward the user to the message page (Msg.jsp)
        System.out.println("Forwarding the user to Msg.jsp with the appropriate message.");
        req.getRequestDispatcher("Msg.jsp").forward(req, res);

        // Debug: Exit point of the servlet
        System.out.println("LogoutServlet execution completed.");
    }
}
