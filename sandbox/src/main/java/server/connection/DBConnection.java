package server.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

public class DBConnection {
	Logger logger = Logger.getLogger("sample");
	String JDBCDriver = "org.postgresql.Driver";
	String user = "admin";
	String password = "12345678";
	String url = "jdbc:postgresql://localhost/leetcode";

	public Connection getConnection() throws SQLException {
        try {
            Class.forName(JDBCDriver);
        } catch (ClassNotFoundException e) {
			String message = "JDBCDriver not found on DBConnection";
			logger.info(message + e.getMessage());
			return null;
        }

        Properties props = new Properties();
		props.setProperty("user", user);
		props.setProperty("password", password);

		try {
            Connection connection = DriverManager.getConnection(url, props);
			logger.info("Connection to DB is established.");
			return connection;
		} catch(SQLException e) {
			String message = "SQL Exception when getting connection on DBConnection";
			logger.info(message + e.getMessage());
			return null;
		}
	}
}
