package OnlineBookStore;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Annotation to map the servlet to the "/edit" URL
@WebServlet("/edit")
@SuppressWarnings("serial")
public class EditBookServlet extends HttpServlet {

    // This method handles GET requests sent to the "/edit" endpoint
    @SuppressWarnings("unchecked")
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve the existing session or return null if no session exists
        HttpSession hs = req.getSession(false);

        // Debug log: Checking if session exists
        System.out.println("EditBookServlet: Checking session validity...");

        if (hs == null) {
            // Log for session expiration
            System.out.println("EditBookServlet: Session expired. Redirecting to Msg.jsp");

            // Set an attribute to show the user that their session has expired
            req.setAttribute("msg", "Session Expired...<br>");

            // Forward the user to the message page
            req.getRequestDispatcher("Msg.jsp").forward(req, res);
        } else {
            // Session is valid; proceed with book retrieval
            System.out.println("EditBookServlet: Session is valid.");

            // Retrieve the book code parameter from the request
            String bC = req.getParameter("bcode");

            // Debug log: Book code received
            System.out.println("EditBookServlet: Received book code: " + bC);

            // Retrieve the list of books stored in the session
            ArrayList<BookBean> al = (ArrayList<BookBean>) hs.getAttribute("alist");

            // Debug log: Checking book list size
            System.out.println("EditBookServlet: Total books in session: " + (al != null ? al.size() : 0));

            // Check if the list of books is not null
            if (al != null) {
                // Iterate over the book list to find the matching book
                Iterator<BookBean> it = al.iterator();
                while (it.hasNext()) {
                    BookBean bb = (BookBean) it.next();

                    // Debug log: Comparing book codes
                    System.out.println("EditBookServlet: Comparing with book code: " + bb.getCode());

                    if (bC.equals(bb.getCode())) {
                        // If book code matches, set the book as a request attribute
                        System.out.println("EditBookServlet: Match found for book code: " + bC);

                        req.setAttribute("bbean", bb);

                        // Forward the user to the EditBook.jsp page for editing the book details
                        req.getRequestDispatcher("EditBook.jsp").forward(req, res);
                        return; // Exit the method as the book is found and processing is complete
                    }
                }

                // If no matching book is found, log a message and inform the user
                System.out.println("EditBookServlet: No book found with the given code: " + bC);
                req.setAttribute("msg", "No book found with the provided code.");
                req.getRequestDispatcher("Msg.jsp").forward(req, res);
            } else {
                // If the book list is null, log an error and inform the user
                System.out.println("EditBookServlet: Book list is null.");
                req.setAttribute("msg", "No books available in the session.");
                req.getRequestDispatcher("Msg.jsp").forward(req, res);
            }
        }
    }
}
