package OnlineBookStore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/add")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession hs = req.getSession(false); // Accessing existing session
        if (hs == null) {
            req.setAttribute("msg", "Session Expired..<br>");
            req.getRequestDispatcher("Msg.jsp").forward(req, res);
            return; // Exit the method if session is expired
        }

        try {
            // Retrieve and validate input parameters
            String bookCode = req.getParameter("bookCode");
            String bookName = req.getParameter("bookName");
            String bookAuthor = req.getParameter("bookAuthor");
            String bookPriceStr = req.getParameter("bookPrice");
            String bookQtyStr = req.getParameter("bookQty");

            if (bookCode == null || bookCode.trim().isEmpty() ||
                bookName == null || bookName.trim().isEmpty() ||
                bookAuthor == null || bookAuthor.trim().isEmpty() ||
                bookPriceStr == null || bookPriceStr.trim().isEmpty() ||
                bookQtyStr == null || bookQtyStr.trim().isEmpty()) {
                req.setAttribute("msg", "All fields are required. Please fill in all the details.<br>");
                req.getRequestDispatcher("AddBook.jsp").forward(req, res);
                return;
            }

            // Parse price and quantity
            float bookPrice;
            int bookQty;
            try {
                bookPrice = Float.parseFloat(bookPriceStr.trim());
                bookQty = Integer.parseInt(bookQtyStr.trim());
            } catch (NumberFormatException e) {
                req.setAttribute("msg", "Invalid input for price or quantity. Please enter valid numbers.<br>");
                req.getRequestDispatcher("AddBook.jsp").forward(req, res);
                return;
            }

            // Populate BookBean with validated data
            BookBean bb = new BookBean();
            bb.setCode(bookCode.trim());
            bb.setName(bookName.trim());
            bb.setAuthor(bookAuthor.trim());
            bb.setPrice(bookPrice);
            bb.setQty(bookQty);

            // Add book to database
            int k = new AddBookDAO().insert(bb);
            if (k > 0) {
                req.setAttribute("msg", "Book details were successfully added!<br>");
            } else {
                req.setAttribute("msg", "Failed to add book details. Please try again.<br>");
            }
            req.getRequestDispatcher("AddBook.jsp").forward(req, res);

        } catch (Exception e) {
            // Handle unexpected errors gracefully
            req.setAttribute("msg", "An unexpected error occurred: " + e.getMessage() + "<br>");
            req.getRequestDispatcher("AddBook.jsp").forward(req, res);
        }
    }
}
