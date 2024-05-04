package server.database;

import org.junit.jupiter.api.Test;
import server.connection.DBConnection;
import server.models.TestCases;

import java.sql.SQLException;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class TestCasesDAOTest {
    @Test
    public void testGetQuestions() {
        TestCasesDAO testCasesDAO = new TestCasesDAO(new DBConnection());
        ArrayList<TestCases> testCases;
        try {
             testCases = testCasesDAO.getTestCasesByQuestionId(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        assertNotNull(testCases);
        assertEquals(testCases.getFirst().id, 1);
        assertEquals(testCases.getFirst().output, "Cactus");
    }
}
