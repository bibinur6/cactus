package server.runner.commands;

public class JsGenerator implements CommandGenerator {
    public String[] getCompileCommand(String path) {
        return new String[0];
    }

    public String[] getRunCommand(String path) {
        String node = "node";
        return new String[]{ node, path };
    }

    public String getCompilePath(String path) {
        return "";
    }
}