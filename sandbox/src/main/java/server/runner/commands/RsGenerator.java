package server.runner.commands;

public class RsGenerator implements CommandGenerator {
    public String[] getCompileCommand(String path) {
        int dotIndex = path.lastIndexOf('.');
        String name = path.substring(0, dotIndex);
        return new String[]{ "rustc", path, "-o", name};
    }

    public String[] getRunCommand(String path) {
        int dotIndex = path.lastIndexOf('.');
        String name = path.substring(0, dotIndex);
        return new String[]{ name };
    }

    public String getCompilePath(String path) {
        int dotIndex = path.indexOf('.');
        return path.substring(0, dotIndex);
    }
}