package server.runner;

import server.models.Runner;
import server.models.TestCases;
import server.runner.commands.CommandGenerator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import java.util.ArrayList;
import java.util.logging.Logger;

public class RunnerSystem {
    Logger logger = Logger.getLogger("sample");
    ArrayList<TestCases> testCases;
    boolean passed = true;
    String language;
    String filename;
    String code;
    CommandGenerator commandGenerator;

    public RunnerSystem(Runner runner, CommandGenerator commandGenerator) {
        this.language = runner.language;
        this.filename = runner.fileName;
        this.testCases = runner.testCases;
        this.code = runner.code;
        this.commandGenerator = commandGenerator;
    }

    public boolean run() {
        String path = writeFile();
        String[] compileCommand = commandGenerator.getCompileCommand(path);
        String[] runCommand = commandGenerator.getRunCommand(path);
        String compilePath = commandGenerator.getCompilePath(path);
        
        
        Tester tester = new Tester(runCommand);
        if(!compile(compileCommand)) {
            cleanUp(path, compilePath);
            return false;
        }
        for(TestCases testCases : this.testCases) {
            passed = tester.test(testCases);
            if(!passed){
                break;
            }
        }

        cleanUp(path, compilePath);
        return passed;
    }

    public String writeFile() {
        String file = filename + "." + language;
        String absolutePath = "/Users/tolymbeknurtai/Desktop/projects/cactus/sandbox/src/main/java/server/runner/tests/";
        String pathName = absolutePath + file;
        logger.info(code);

        try{
            FileWriter fileWriter = new FileWriter(pathName);
            fileWriter.write(code);
            fileWriter.close();
            logger.info("Wrote code to the file in runner");
        } catch (IOException e) {
            String message = "Error writing code to the file in runner";
            logger.info(message + e.getMessage());
        }

        return pathName;
    }

    public boolean compile(String[] compileCommand) {
        if(compileCommand.length == 0) {
            logger.info("compiled in runner");
            return true;
        }
        logger.info("started compiling in runner.");

        ProcessBuilder processBuilder = new ProcessBuilder(compileCommand);
        for(String i : compileCommand) {
            logger.info(i);
        }
        String logFile = "./tests/log.txt";
        processBuilder.redirectError(new File(logFile));

        try {
            Process process = processBuilder.start();
            int out = process.waitFor();
            if(out == 0) {
                logger.info("compiled in runner");
                return true;
            }
        } catch (IOException | InterruptedException e) {
            String message = "Error compiling";
            logger.info(message + e.getMessage());
        }
        return false;
    }

    public void cleanUp(String path, String compilePath) {
        try {
            File file = new File(path);
            if (!file.delete()) {
                logger.info("Error removing file: " + path);
            }
            if(!compilePath.isEmpty()) {
                return;
            }
            file = new File(compilePath);
            if (!file.delete()) {
                logger.info("Error removing file: " + path);
            }
            logger.info("cleaned up the files in runner");
                
        } catch (SecurityException e) {
            String message = "Error cleaning up in Runner.";
        }
    }
}
