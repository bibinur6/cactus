package server.runner.commands;

public class CommandFactory {
    public static CommandGenerator getGenerator(String language) {
        Language langEnum = Language.valueOf(language.toUpperCase());

        return switch (langEnum) {
            case JS -> new JsGenerator();
            case PY -> new PyGenerator();
            case CPP -> new CppGenerator();
            case JAVA -> new JavaGenerator();
            case PHP -> new PhpGenerator();
            case RS -> new RsGenerator();
            case SWIFT -> new SwiftGenerator();
            default -> throw new IllegalArgumentException("Unsupported language: " + language);
        };
    }
}