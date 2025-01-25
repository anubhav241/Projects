package OnlineBookStore;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
@SuppressWarnings("serial")
public class UpdateBookServlet extends HttpServlet {

    // Logger for debugging
    private static final Logger logger = Logger.getLogger(UpdateBookServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Log entry point
        logger.info("UpdateBookServlet invoked");

        // Retrieve session
        HttpSession hs = req.getSession(false);
        if (hs == null) {
            logger.warning("Session expired. Redirecting to Msg.jsp with error message.");
            req.setAttribute("msg", "Session Expired. Please log in again.<br>");
            req.getRequestDispatcher("Msg.jsp").forward(req, res);
            return;
        }

        try {
            // Retrieve parameters from the request
            String bookCode = req.getParameter("bcode");
            float bookPrice = Float.parseFloat(req.getParameter("bprice"));
            int bookQuantity = Integer.parseInt(req.getParameter("bqty"));
            logger.info(String.format("Received book details: Code=%s, Price=%.2f, Quantity=%d", bookCode, bookPrice, bookQuantity));

            // Retrieve the list of books from the session
            @SuppressWarnings("unchecked")
            ArrayList<BookBean> bookList = (ArrayList<BookBean>) hs.getAttribute("alist");

            if (bookList == null || bookList.isEmpty()) {
                logger.warning("Book list is empty or null. Unable to proceed with update.");
                req.setAttribute("msg", "No books available to update.<br>");
                req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);
                return;
            }

            // Iterate through the book list to find the matching book
            boolean bookFound = false;
            for (BookBean book : bookList) {
                if (bookCode.equals(book.getCode())) {
                    // Update book details
                    logger.info("Book found. Updating details.");
                    book.setPrice(bookPrice);
                    book.setQty(bookQuantity);

                    // Persist the changes using DAO
                    int rowsUpdated = new UpdateBookDAO().update(book);
                    if (rowsUpdated > 0) {
                        logger.info("Book updated successfully in the database.");
                        req.setAttribute("msg", "Book Updated Successfully!<br>");
                    } else {
                        logger.warning("Failed to update book in the database.");
                        req.setAttribute("msg", "Failed to update the book. Please try again.<br>");
                    }

                    bookFound = true;
                    break;
                }
            }

            if (!bookFound) {
                logger.warning("Book with the given code not found.");
                req.setAttribute("msg", "Book not found.<br>");
            }

            // Forward to the appropriate page with a message
            req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);

        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid input format. Price and Quantity must be numeric.", e);
            req.setAttribute("msg", "Invalid input format. Please ensure Price and Quantity are numeric.<br>");
            req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An unexpected error occurred.", e);
            req.setAttribute("msg", "An unexpected error occurred. Please try again later.<br>");
            req.getRequestDispatcher("UpdateBook.jsp").forward(req, res);
        }

        // Log exit point
        logger.info("UpdateBookServlet execution completed.");
    }
}
