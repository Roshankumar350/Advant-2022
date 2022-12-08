//
//  Logic5.swift
//  Advant-2022
//
//  Created by Roshan sah on 07/12/22.
//

import Foundation

var cranes = [
    "D L V T M H F".components(separatedBy: " "),
    "H Q G J C T N P".components(separatedBy: " "),
    "R S D M P H".components(separatedBy: " "),
    "L B V F".components(separatedBy: " "),
    "N H G L Q".components(separatedBy: " "),
    "W B D G R M P".components(separatedBy: " "),
    "G M N R C H L Q".components(separatedBy: " "),
    "C L W".components(separatedBy: " "),
    "R D L Q J Z M T".components(separatedBy: " ")
]


var tempCranes = [
    "Z N".components(separatedBy: " "),
    "M C D".components(separatedBy: " "),
    "P".components(separatedBy: " ")
]

func findCrateEndUpOnTopOfStackPart1() {
    
    let lines = data5.components(separatedBy: .newlines)
    print(cranes)

    for eachLine in lines {
        print(eachLine)
        let componentLine = eachLine.components(separatedBy: .whitespaces)
        // move 1 from 7 to 6
        if let numberOfItemToMove = Int(componentLine[1]), let fromWhichStack = Int(componentLine[3]), let toWhichStack = Int(componentLine[5]) {
            
            var fromStack = cranes[fromWhichStack-1]
            var toStack = cranes[toWhichStack-1]
            
            for _ in 1...numberOfItemToMove {
                let poppedElement = fromStack.removeLast()
                toStack.append(poppedElement)
            }
            
            cranes[fromWhichStack-1] = fromStack
            cranes[toWhichStack-1] = toStack
        }
    }
    
    var elements = [String]()
    for var eachStack in cranes {
        let lastElement = eachStack.removeLast()
        elements.append(lastElement)
    }
    print(elements.compactMap{ $0 }.joined())
    
}


func findCrateEndUpOnTopOfStackPart2() {
    
    let lines = data5.components(separatedBy: .newlines)
    
    for eachLine in lines {
        let componentLine = eachLine.components(separatedBy: .whitespaces)
        if let numberOfItemToMove = Int(componentLine[1]), let fromWhichStack = Int(componentLine[3]), let toWhichStack = Int(componentLine[5]) {
            
            var fromStack = cranes[fromWhichStack-1]
            var toStack = cranes[toWhichStack-1]
            
            let poppedElements = Array(fromStack.suffix(numberOfItemToMove))
            (1...numberOfItemToMove).forEach { _ in
                fromStack.removeLast()
            }
            toStack.append(contentsOf: poppedElements)
            
            cranes[fromWhichStack-1] = fromStack
            cranes[toWhichStack-1] = toStack
        }
    }
    
    var elements = [String]()
    for var eachStack in cranes {
        let lastElement = eachStack.removeLast()
        elements.append(lastElement)
    }
    print(elements.compactMap{ $0 }.joined())
    
}
