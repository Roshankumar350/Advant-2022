//
//  Logic1.swift
//  Advant-2022
//
//  Created by Roshan sah on 01/12/22.
//

import Foundation

func findMaxCalories() {
    let inputArray = data1.components(separatedBy: .whitespacesAndNewlines)

    var maxCalories = Int.min
    
    var cumulativeCalories = 0

    for eachNumber in inputArray {
        if let number = Int(eachNumber) { 
            cumulativeCalories += number
        } else {
            if cumulativeCalories > maxCalories {
                maxCalories =  cumulativeCalories
            }
            cumulativeCalories = 0
        }
    }
    
    print(maxCalories)
}
