package agrowise;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    // Database connection settings
    private final String dbServer = "195.251.249.131";
    private final String dbServerPort = "3306";
    private final String dbName = "ismgroup21";
    private final String dbusername = "ismgroup21";
    private final String dbpassword = System.getenv("DB_PASSWORD"); // Fetch password from environment variable

    private Connection con = null;

    /**
     * Establishes a connection with the database, initializes and returns
     * the Connection object.
     * 
     * @return Connection, the Connection object
     * @throws Exception
     */
    public Connection getConnection() throws Exception {
        try {
            // Dynamically load the driver's class file into memory
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception e) {
            throw new Exception("MySQL Driver error: " + e.getMessage());
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://"
                    + dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);
            return con;
        } catch (Exception e) {
            throw new Exception("Could not establish connection with the Database Server: " + e.getMessage());
        }
    }

    /**
     * Close database connection.
     * 
     * @throws SQLException
     */
    public void close() throws SQLException {
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
        }
    }
}
