package server.runner.commands;

public class PyGenerator implements CommandGenerator {
    public String[] getCompileCommand(String path) {
        return new String[0];
    }

    public String[] getRunCommand(String path) {
        return new String[]{ "python3", path };
    }

    public String getCompilePath(String path) {
        return "";
    }
}