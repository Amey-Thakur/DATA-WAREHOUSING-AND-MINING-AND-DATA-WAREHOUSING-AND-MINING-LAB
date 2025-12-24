/*
============================================================================================
DATA WAREHOUSING AND MINING LABORATORY
Experiment 8: Frequent Pattern Mining (FP-Growth Logic)
============================================================================================

Author: Amey Thakur
GitHub: https://github.com/Amey-Thakur
Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB

Course: Data Warehousing and Mining Lab (CSL603)
Semester: VI | Institution: Terna Engineering College | University: Mumbai
Date: April 28, 2021

============================================================================================
AIM:
Implementation Association Mining-FPM (Frequent Pattern Mining) Algorithm.

DESCRIPTION:
This Java program demonstrates a simplified logic for finding frequent patterns within
a hardcoded set of string transactions using character support counting.

INPUT STRINGS (Transactions):
- "lmno"
- "ml"
- "omnp"
- "pon"
- "ponm"
- "nom"

MINIMUM SUPPORT: 4
============================================================================================
*/

import java.util.*;

class FPM {
    public static void main(String args[]) {
        // Define the itemset characters to track
        char b[] = {'l', 'm', 'n', 'o', 'p'};
        // Array to store support counts for each item
        int b1[] = {0, 0, 0, 0, 0};
        
        // Transaction dataset
        String a[] = {"lmno", "ml", "omnp", "pon", "ponm", "nom"};
        
        int min = 4; // Minimum support count
        int i, j, p, c = 0;

        // ===================================
        // STEP 1: CALCULATE SUPPORT FOR EACH ITEM
        // ===================================
        for (i = 0; i < 5; i++) { // For each unique item 'l', 'm', 'n', 'o', 'p'
            c = 0;
            for (j = 0; j < a.length; j++) { // Iterate through all transactions
                for (p = 0; p < a[j].length(); p++) { // Iterate through each char in transaction
                    if (b[i] == a[j].charAt(p)) {
                        c = c + 1;
                    }
                }
            }
            b1[i] = c;
        }

        // ===================================
        // STEP 2: DISPLAY INPUT STRINGS
        // ===================================
        System.out.println("INPUT STRINGS:");
        for (j = 0; j < a.length; j++) {
            System.out.println(a[j]);
        }
        
        // ===================================
        // STEP 3: DISPLAY INITIAL SUPPORT COUNTS
        // ===================================
        System.out.println("\nInitial Support Counts:");
        for (i = 0; i < b1.length; i++) {
            System.out.println(b[i] + " Support: " + b1[i]);
        }

        // ===================================
        // STEP 4: ELIMINATE ITEMS < MIN SUPPORT
        // ===================================
        System.out.println("\nMinimum Support: " + min + "\n\nAFTER ELIMINATING ELEMENT HAVING LESS SUPPORT THAN MINIMUM SUPPORT:");
        
        for (i = 0; i < b1.length; i++) {
            if (b1[i] >= min) {
                // Item meets threshold, keep it
            } else {
                // Item fails threshold, zero it out (conceptually remove)
                b1[i] = 0;
            }
        }

        // Display remaining items
        for (i = 0; i < b1.length; i++) {
            if (b1[i] != 0) { // Only print if not eliminated
                System.out.println(b[i] + " Support: " + b1[i]);
            }
        }

        // ===================================
        // STEP 5: GENERATE FP TREE PATHS
        // ===================================
        // This simulates finding the path in an FP-tree for frequent items
        System.out.println("\nFP TREE PATHS:");
        
        for (j = 0; j < a.length; j++) { // For each transaction
            System.out.print("ROOT: ");
            for (p = 0; p < a[j].length(); p++) { // Check each char
                // If the char is one of our frequent items (support > 0 check slightly adapted)
                 for (i = 0; i < 5; i++) {
                     // Check if character matches AND it is a frequent item (b1[i] != 0)
                     if (b[i] == a[j].charAt(p) && b1[i] != 0) {
                         System.out.print(a[j].charAt(p) + "->");
                     }
                 }
            }
            System.out.println("NULL");
        }
    }
}
