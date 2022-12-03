//
//  Logic3.swift
//  Advant-2022
//
//  Created by Roshan sah on 04/12/22.
//

import Foundation

func createHashtable() -> [Character: Int] {
    let aToZ = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var num = 0
    var hashTable = [Character: Int]()
    
    for each in aToZ {
        num += 1
        hashTable[each] = num
    }
    
    return hashTable
}


func sumOfPriorityOfNumberPart1() {
    let eachLines = data3.components(separatedBy: .newlines)
    
    var commonChars = [Character]()
    
    for eachLine in eachLines {
        let characters = eachLine.trimmingCharacters(in: .whitespaces).map{ $0 }
        
        let count = characters.count
        
        let firstHalf = Array(characters[0..<count/2])
        var secondHalf = Array(characters[count/2..<count])
        
        for eachChar in firstHalf where secondHalf.contains(eachChar) {
            commonChars.append(eachChar)
            secondHalf.removeAll { char in
                eachChar == char
            }
        }
    }
    
    let hashTable = createHashtable()
    var sum = 0
    
    for char in commonChars {
        if let num = hashTable[char] {
            sum += num
        }
    }
    
    print(sum)
}
