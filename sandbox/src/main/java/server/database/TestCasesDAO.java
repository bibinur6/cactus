package server.database;

import server.connection.DBConnection;
import server.models.TestCases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.logging.Logger;

public class TestCasesDAO {
    Logger logger = Logger.getLogger("sample");
    DBConnection dbConnection;

    public TestCasesDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }

    public ArrayList<TestCases> getTestCasesByQuestionId(int question_id) throws SQLException {
        ArrayList<TestCases> testCases = new ArrayList<>();
        String sql = "SELECT id, question_id, input, output FROM test WHERE question_id = ?;";

        ResultSet results = null;
        try (
                Connection connection = dbConnection.getConnection();
                PreparedStatement ps = connection.prepareStatement(sql)
        ) {
            ps.setInt(1, question_id);
            results = ps.executeQuery();

            addTestCases(results, testCases);

            return testCases;
        } catch (SQLException e) {
            String message = "Error getting test cases from DB: ";
            logger.info(message + e.getMessage());
            return null;
        } finally {
            if (results != null) {
                results.close();
            }
        }
    }

    private void addTestCases(ResultSet results, ArrayList<TestCases> testCases) throws SQLException {
        while (results.next()) {
            TestCases testCase = new TestCases();
            testCase.id = results.getInt("id");
            testCase.questionId = (results.getInt("question_id"));
            testCase.input = results.getString("input");
            testCase.output = results.getString("output");
            logger.info("Test cases: ");
            logger.info(testCase.input);
            logger.info(testCase.output);

            testCases.add(testCase);
        }
    }
}