package com.example.lib;

public interface Task {
    void run();
    void onFinished(String result);
}
