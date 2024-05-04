package server.connection;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class DBConnectionTest {
    @Test
    public void testConnection() {
        DBConnection dbConnection = new DBConnection();
        try {
            Connection connection = dbConnection.getConnection();
            assertNotNull(connection);
            assertFalse(connection.isClosed());
            connection.close();
        } catch (SQLException e) {
            fail("Failed to establish a connection: " + e.getMessage());
        }
    }
}