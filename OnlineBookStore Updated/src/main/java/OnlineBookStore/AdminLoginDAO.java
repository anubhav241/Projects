package OnlineBookStore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO {
    public AdminBean ab = null;

    public AdminBean Login(String uN, String pW) {
        System.out.println("AdminLoginDAO: Starting login process...");
        try {
            // Get the database connection
            Connection con = DBConnection.getCon();
            if (con == null) {
                System.err.println("AdminLoginDAO: Database connection is null. Check DBConnection setup.");
                return null;
            }
            System.out.println("AdminLoginDAO: Database connection established successfully.");

            // Prepare the SQL query
            String sql = "SELECT * FROM admin WHERE uname=? AND pword=?";
            System.out.println("AdminLoginDAO: Preparing statement: " + sql);

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uN);
            ps.setString(2, pW);

            // Debug: Log the final query with parameter values
            System.out.println("Executing query: SELECT * FROM admin WHERE uname='" + uN + "' AND pword='" + pW + "'");
            ResultSet rs = ps.executeQuery();

            // Check if a result exists
            if (rs.next()) {
                System.out.println("AdminLoginDAO: Login successful. Retrieving admin details...");
                ab = new AdminBean(); // Create a new AdminBean object

                // Set values in the AdminBean from the result set
                ab.setuName(rs.getString("uname"));
                ab.setpWord(rs.getString("pword"));
                ab.setfName(rs.getString("fname"));
                ab.setlName(rs.getString("lname"));
                ab.setAddr(rs.getString("addr"));
                ab.setmId(rs.getString("mid"));
                ab.setPhNo(rs.getLong("phno"));

                System.out.println("AdminLoginDAO: Admin details retrieved successfully: " + ab.getuName());
            } else {
                System.out.println("AdminLoginDAO: Login failed. No matching records found.");
            }
        } catch (Exception e) {
            System.err.println("AdminLoginDAO: An error occurred during login.");
            e.printStackTrace();
        }
        System.out.println("AdminLoginDAO: Login process completed.");
        return ab;
    }
}
