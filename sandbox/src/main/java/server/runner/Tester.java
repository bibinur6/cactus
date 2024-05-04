package server.runner;

import server.models.TestCases;

import java.io.*;
import java.util.logging.Logger;

public class Tester {
    Logger logger = Logger.getLogger("sample");
    String[] runCommand;

    public Tester(String[] runCommand) {
        this.runCommand = runCommand;
    }

    public boolean test(TestCases testCases) {
        try {
            for (String i : runCommand) {
                logger.info(i);
            }

            ProcessBuilder processBuilder = new ProcessBuilder(runCommand);
            String logFile = "/Users/tolymbeknurtai/Desktop/projects/cactus/sandbox/src/main/java/server/runner/tests/log.txt";
            processBuilder.redirectError(new File(logFile));

            Process process = processBuilder.start();
            logger.info("process started in tester");

            InputStream stdout = process.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stdout));
            writeInput(testCases, process);

            int out = process.waitFor();
            if (out != 0) {
                return false;
            }

            String output = readOutput(bufferedReader);
            logger.info("Test case: ");
            logger.info(testCases.output);
            logger.info("Output of code: ");
            logger.info(output);
            if(output.equals(testCases.output)) {
                return true;
            }
        } catch (IOException | InterruptedException e) {
            String message = "Error testing code";
            logger.info(message + e.getMessage());
        }
        return false;
    }

    private void writeInput(TestCases testCases, Process process) {
        new Thread(() -> {
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()))) {
                logger.info(testCases.input);
                if (testCases.input.equals("null")) {
                    return;
                }

                String[] input = testCases.input.split("/");
                for (String i : input) {
                    logger.info(i);
                    writer.write(i);
                    writer.write("\n");
                }
                writer.flush();

                logger.info("wrote input in tester");
            } catch (IOException e) {
                String message = "Error writing input in Tester.";
                logger.info(message + e.getMessage());
            }
        }).start();
    }

    private String readOutput(BufferedReader bufferedReader) {
        String line;
        StringBuilder output = new StringBuilder();
        try {
            while ((line = bufferedReader.readLine()) != null) {
                if (!output.isEmpty()) {
                    output.append("/");
                }
                output.append(line);
                logger.info(line);
                logger.info("this is line");
            }
            logger.info("read the output");

        } catch (IOException e) {
            String message = "Error reading output in Tester.";
            logger.info(message + e.getMessage());
        }
        return output.toString();
    }
}
