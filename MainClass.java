package com.example.lib;

import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MainClass {

    public static void main(String[] args) {
        MainClass mainClass = new MainClass();
        // generate dummy data
        ArrayList<Callable<Task>> tasks = mainClass.generateDummyTasks();
        // process tasks
        mainClass.processTasks(tasks);
    }

    private ArrayList<Callable<Task>> generateDummyTasks() {
        ArrayList<Callable<Task>> tasks = new ArrayList<>();
        ArrayList<Integer> objects = new ArrayList<>();

        objects.add(100);
        objects.add(300);
        objects.add(5000);
        objects.add(150);

        for (final Integer object : objects) {
            tasks.add(new Callable<Task>() {
                @Override
                public Task call() {
                    TestTask testTask = new TestTask(object);
                    testTask.run();
                    return testTask;
                }
            });
        }
        return tasks;
    }

    void processTasks(final ArrayList<Callable<Task>> tasks) {
        ExecutorService executor = Executors.newCachedThreadPool();
        try {
            executor.invokeAll(tasks);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        executor.shutdown();
        System.out.println("\nFinished all tasks");
    }
}
