package com.example.lib;

public class TestTask implements Task {
    int delay;

    TestTask(int delay) {
        this.delay = delay;
    }

    @Override
    public void run() {
        System.out.println("Started task in thread " + Thread.currentThread().getId());
        try {
            Thread.sleep(delay);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
//        System.out.println("Ended task in thread " + Thread.currentThread().getId());
        onFinished("Task Started on Thread " + Thread.currentThread().getId() + " has returned a result.");
    }

    @Override
    public void onFinished(String result) {
        // do something with that result
        System.out.println(result);

    }
}
