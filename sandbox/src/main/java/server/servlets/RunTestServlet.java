package server.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import server.connection.DBConnection;
import server.database.TestCasesDAO;
import server.models.Runner;

import org.json.JSONObject;
import server.runner.RunnerSystem;
import server.runner.commands.CommandFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

@WebServlet(name = "RunTestServlet", value = "/api/run")
public class RunTestServlet extends HttpServlet {
    Logger logger = Logger.getLogger("sample");

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        logger.info("New Request.");
        BufferedReader bufferedReader = null;
        try {
            bufferedReader = request.getReader();

        } catch (IOException e) {
            logger.info("Couldn't read request in RunServlet: " + e.getMessage());
        }

        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while (true) {
            logger.info("Started reading request.");
            try {
                if ((line = bufferedReader.readLine()) != null) {
                    stringBuilder.append(line);
                } else {
                    logger.info("Empty");
                    break;
                }
            } catch (IOException e) {
                logger.info("Error reading in buffered reader in runservlet: " + e.getMessage());
            }
        }

        JSONObject jsonObject = new JSONObject(stringBuilder.toString());
        Runner runnerModel = new Runner();
        TestCasesDAO testCasesDAO = new TestCasesDAO();

        runnerModel.code = jsonObject.getString("code");
        runnerModel.language = jsonObject.getString("language");
        runnerModel.fileName = jsonObject.getString("fileName");runnerModel.code = jsonObject.getString("code");
        logger.info(jsonObject.getString("code"));
        logger.info(jsonObject.getString("language"));
        logger.info(jsonObject.getString("fileName"));


        int id = jsonObject.getInt("id");
        logger.info("Question's id is " + String.valueOf(id));
        try {
            runnerModel.testCases = testCasesDAO.getTestCasesByQuestionId(id);
            logger.info("got testcases for runservlet");
        } catch (SQLException e) {
            logger.info("Error getting testcases: " + e.getMessage());
        }

        RunnerSystem runner = new RunnerSystem(runnerModel, CommandFactory.getGenerator(runnerModel.language));
        logger.info("started running running in runner");
        boolean passed = runner.run();

        JSONObject obj = new JSONObject();
        if(passed) {
            obj.put("passed", true);
            logger.info("tests are passed");
        } else {
            obj.put("passed", false);
            logger.info("tests are not passed");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            logger.info("sent the results from runservlet");
            response.getWriter().write(obj.toString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
