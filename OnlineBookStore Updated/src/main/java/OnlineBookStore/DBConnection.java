package OnlineBookStore;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con = null;

    private DBConnection() {}

    static {
        try {
            System.out.println("Attempting to load Oracle driver...");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Oracle driver loaded successfully!");

            System.out.println("Attempting to establish database connection...");
            con = DriverManager.getConnection(DBInfo.dbUrl, DBInfo.uName, DBInfo.pWord);
            System.out.println("Database connected successfully!");

        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC driver not found. Make sure ojdbc8.jar is in the classpath.");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Failed to establish database connection.");
            e.printStackTrace();
        }
        System.out.println("Connection: " + con);
    }

    public static Connection getCon() {
    	System.out.println("Connection: " + con);
        return con;
    }
}
