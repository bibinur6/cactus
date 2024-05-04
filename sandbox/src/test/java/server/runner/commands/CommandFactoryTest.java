package server.runner.commands;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static org.junit.jupiter.api.Assertions.assertInstanceOf;

public class CommandFactoryTest {
    @Test
    public void getGeneratorTest() {
        assertInstanceOf(JsGenerator.class, CommandFactory.getGenerator("js"));
        assertInstanceOf(PyGenerator.class, CommandFactory.getGenerator("py"));
        assertInstanceOf(CppGenerator.class, CommandFactory.getGenerator("cpp"));
        assertInstanceOf(JavaGenerator.class, CommandFactory.getGenerator("java"));
        assertInstanceOf(PhpGenerator.class, CommandFactory.getGenerator("php"));
        assertInstanceOf(RsGenerator.class, CommandFactory.getGenerator("rs"));
        assertInstanceOf(SwiftGenerator.class, CommandFactory.getGenerator("swift"));
    }
}