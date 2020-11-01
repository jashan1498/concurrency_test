package com.example.lib;

import java.util.ArrayList;

public class RedemptionAlgorithm {

    // the scenario we have is as follows :
    // there are 10 coins in a users account with denominations of 2,3,5 with expiry date as 10th November , 20th November , 30th November respectively

    // case 1 : user wants to consume 11 coins
    // case 2 : user wants to consume 9 coins
    // case 3 : user wants to consume 7 coins on 20th November
    // case 3 : loyal wants to consume 8 coins on 8th November

    // search algorithm:
    // if required number : reqNum = 7
    // x = find the largest possible number using binary search which is equal to or less than the required number
    // find counter number using reqNum - x .. if suitable return this number or repeat search with x-1

    ArrayList<Coin> coinArrayList = new ArrayList<>();

    public static void main(String[] args) {
//        RedemptionAlgorithm redemptionAlgorithm = new RedemptionAlgorithm();
//       redemptionAlgorithm.coinArrayList = coinsList();
//       int reqNum = 5;
//       Result result = redemptionAlgorithm.findCoinCombination(reqNum,redemptionAlgorithm.coinArrayList);

//        if (result.containsPair()){
//           found perfect match
//        }else if (result.nearestValue.isNotNull()){
//           request to Pay the rest amount
//        }else{
//          request to pay complete value
//        }
    }

//    private Result findCoinCombination(int reqNum, List<Coin> coinList) {
//        if(!coinList.isEmpty()){
//        int closestNumber = findClosestNumber(coinList);
//            pairCoin = findPairCoin(closestNumber);
//            if (pairCoin != null) {
//                return new Result(coin, pairCoin);
//            } else {
//                coinList.remove(closestNumber);
//                return findCoinCombination(reqNum, coinList);
//            }
//        } else {
//            // when there is no possible combination found
//            return new Result(findClosestNumber(coinArrayList));
//        }

//    int findPairCoin() {
//        if (customer.isLoyal()) {
//            // find closest expiring coin
//        } else {
//            // find closest coin
//        }
//    }

//    int findClosestNumber(List<Coin> coinList){
    // find nearest max number from coinList
//    }

}