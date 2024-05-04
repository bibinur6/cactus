package server.runner;

import org.junit.jupiter.api.Test;
import static  org.junit.jupiter.api.Assertions.*;

import server.models.Runner;
import server.models.TestCases;
import server.runner.commands.JsGenerator;

public class RunnerTest {
    @Test
    public void testRunner1() {
        Runner runnerModel = new Runner();
        TestCases testCases = new TestCases();

        testCases.input = "null";
        testCases.output = "Cactus";
        runnerModel.testCases.add(testCases);

        runnerModel.fileName = "Example";
        runnerModel.code = "console.log('Cactus')";
        runnerModel.language = "js";

        RunnerSystem runner = new RunnerSystem(runnerModel, new JsGenerator());
        boolean passed = runner.run();
        assertTrue(passed);
    }

    @Test
    public void testRunner2() {
        Runner runnerModel = new Runner();
        TestCases testCases = new TestCases();

        testCases.input = "CodeCraft";
        testCases.output = "CodeCraft";
        runnerModel.testCases.add(testCases);

        runnerModel.fileName = "Example";
        runnerModel.code = "const readline=require('readline');const rl=readline.createInterface({input:process.stdin,output:process.stdout});rl.question(\"\",function(line){console.log(line);rl.close();});\n";
        runnerModel.language = "js";

        RunnerSystem runner = new RunnerSystem(runnerModel, new JsGenerator());
        boolean passed = runner.run();
        assertTrue(passed);
    }
}
