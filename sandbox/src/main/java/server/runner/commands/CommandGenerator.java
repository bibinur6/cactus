package server.runner.commands;

public interface CommandGenerator {
    String[] getCompileCommand(String path);
    String[] getRunCommand(String path);
    String getCompilePath(String path);
}