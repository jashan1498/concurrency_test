package com.example.lib;

import java.sql.Timestamp;
import java.util.ArrayList;

class Customer {
    Timestamp validity;
    String transactionId;
    int amount;
    ArrayList<Coin> coinArrayList;
    boolean isLoyal;
}
