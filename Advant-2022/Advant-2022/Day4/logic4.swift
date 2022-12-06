//
//  logic4.swift
//  Advant-2022
//
//  Created by Roshan sah on 04/12/22.
//

import Foundation

func getRange(for rangeString: String) -> (lowerBound: Int, upperBound: Int) {
    let lowerAndUpperBound = rangeString.components(separatedBy: "-")
    let lowerBound = Int(lowerAndUpperBound.first ?? "") ?? 0
    let upperBound = Int(lowerAndUpperBound.last ?? "") ?? 0
    return (lowerBound, upperBound)
}

func findNumberOfRangeFullContainInOthersPart1() {
    let ranges = data4.components(separatedBy: .whitespacesAndNewlines)
    // 2-4,6-8
    var count = 0
    for eachRange in ranges {
        let tupleRange = eachRange.trimmingCharacters(in: .whitespaces).components(separatedBy: ",")
        
        let firstRange = getRange(for: tupleRange.first ?? "")
        let secondRange = getRange(for: tupleRange.last ?? "")
        
        
        if firstRange.lowerBound == firstRange.upperBound {
            if secondRange.lowerBound  <= firstRange.lowerBound && secondRange.upperBound >= firstRange.upperBound {
                count += 1
                continue
            }
        }
        
        if secondRange.lowerBound == secondRange.upperBound {
            if firstRange.lowerBound  <= secondRange.lowerBound && firstRange.upperBound >= secondRange.upperBound {
                count += 1
                continue
            }
        }
        
        
        if (firstRange.lowerBound <= secondRange.lowerBound)  && (firstRange.upperBound >= secondRange.upperBound) {
            count += 1
            continue
        }
        
        if (firstRange.lowerBound >= secondRange.lowerBound)  && (firstRange.upperBound <= secondRange.upperBound) {
            count += 1
            continue
        }
        
    }
    
    print(count)
    
}

func findNumberOfRangeFullContainInOthersPart2() {
    let ranges = data4.components(separatedBy: .whitespacesAndNewlines)
    
    var count = 0
    for eachRange in ranges {
        let tupleRange = eachRange.trimmingCharacters(in: .whitespaces).components(separatedBy: ",")
        
        let firstRange = getRange(for: tupleRange.first ?? "")
        let secondRange = getRange(for: tupleRange.last ?? "")
        
        if !Set(firstRange.lowerBound...firstRange.upperBound).isDisjoint(with: Set(secondRange.lowerBound...secondRange.upperBound)) {
            count += 1
        }
        
    }
    
    print(count)
}
