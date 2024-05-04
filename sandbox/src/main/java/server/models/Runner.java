package server.models;

import java.util.ArrayList;

public class Runner {
    public String fileName;
    public String code;
    public ArrayList<TestCases> testCases;
    public String language;

    public Runner() {
        testCases = new ArrayList<>();
    }
}