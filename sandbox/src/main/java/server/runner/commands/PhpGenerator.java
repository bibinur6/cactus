package server.runner.commands;

public class PhpGenerator implements CommandGenerator {
    public String[] getCompileCommand(String path) {
        return new String[0];
    }

    public String[] getRunCommand(String path) {
        String node = "php";
        return new String[]{ node, path };
    }

    public String getCompilePath(String path) {
        return "";
    }
}