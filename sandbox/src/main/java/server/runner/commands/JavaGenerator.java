package server.runner.commands;

import java.io.File;

public class JavaGenerator implements CommandGenerator {
    public String[] getCompileCommand(String path) {
        return new String[]{ "javac", path };
    }

    public String[] getRunCommand(String path) {
        File file = new File(path);
        String classPath = file.getParent();

        String name = file.getName();
        int dotIndex = name.lastIndexOf('.');
        name = name.substring(0, dotIndex);
        return new String[]{ "java", "-cp", classPath, name };
    }

    public String getCompilePath(String path) {
        int dotIndex = path.indexOf('.');
        String name = path.substring(0, dotIndex);
        return name + ".class";
    }
}