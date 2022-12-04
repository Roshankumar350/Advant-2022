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

func sumOfPriorityOfNumberPart2() {
    let eachLines = data3.components(separatedBy: .newlines)
    
    var clubbedLines = [String]()
    
    var clubbedLine = ""
    for (lineIndex, eachLine)in eachLines.enumerated() {
        clubbedLine += "\(eachLine)--"
        
        if (lineIndex+1).isMultiple(of: 3) {
            clubbedLines.append(clubbedLine)
            clubbedLine = ""
        }
    }
    
    var commonChars = [String]()
    for eachClubbedLine in clubbedLines {
        let lines = eachClubbedLine.components(separatedBy: "--").filter{ !$0.isEmpty }
        var intersectionChars = Set(lines.first?.map{"\($0)"} ?? [""])
        
        // Please note, it will execute 3 times per loop execution
        for (eachIndex, eachLine) in lines.enumerated() where eachIndex != 0 {
            let otherSequence = Set(eachLine.map{ "\($0)" })
            intersectionChars = intersectionChars.intersection(otherSequence)
        }
        
        commonChars.append(contentsOf: Array(intersectionChars))
    }
    
    let hashTable = createHashtable()
    var sum = 0
    
    for char in commonChars {
        if let num = hashTable[Character(char)] {
            sum += num
        }
    }
    
    print(sum)
}
