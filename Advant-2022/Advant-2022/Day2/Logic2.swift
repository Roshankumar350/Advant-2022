//
//  Logic2.swift
//  Advant-2022
//
//  Created by Roshan sah on 02/12/22.
//

import Foundation

enum Shape: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
    init(char: Character) {
        if char == "A" ||  char == "X" {
            self = .rock
        } else if( char == "B" ||  char == "Y") {
            self = .paper
        } else {
            self = .scissors
        }
    }
}
enum Scores: String {
    case patternA = "A X"
    case patternB = "B Y"
    case patternC = "C Z"
    
    static func getScoresForPart1(for char: Character) ->  Int {
        if Scores.patternA.rawValue.contains(char) {
            return 1
        } else if Scores.patternB.rawValue.contains(char) {
            return 2
        } else if Scores.patternC.rawValue.contains(char) {
            return 3
        } else {
            return 0
        }
    }
    
    
    // Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock.
    static func getWinningScoreForPart1(for opponentShape: Shape, yourShape: Shape) -> Int {
        switch (opponentShape, yourShape) {
        case (.rock , .rock):
            return 3
        case (.paper , .paper):
            return 3
        case (.scissors , .scissors):
            return 3
        case (.scissors, .rock):
            return 6
        case (.paper, .scissors):
            return 6
        case (.rock, .paper):
            return 6
        case (.scissors, .paper):
            return 0
        case (.paper, .rock):
            return 0
        case (.rock, .scissors):
            return 0
        }
    }
    
    static func getScoresForPart2(for opponentShape: Shape, yourShape: Shape) -> Int {
        switch yourShape {
        case .rock: // X == loss
            switch opponentShape {
            case .paper:
                return Shape.rock.rawValue
            case .scissors:
                return Shape.paper.rawValue
            case .rock:
                return Shape.scissors.rawValue
            }
        case .paper: // Y == draw
            return opponentShape.rawValue
        case .scissors: // Z == Win
            switch opponentShape {
            case .paper:
                return Shape.scissors.rawValue
            case .scissors:
                return Shape.rock.rawValue
            case .rock:
                return Shape.paper.rawValue
            }
        }
    }
    
    // Rock == loss, Paper == draw, and  scissors == win.
    static func getWinningScoreForPart2(for yourShape: Shape) -> Int {
        switch yourShape {
        case .rock:
            return 0
        case .paper:
            return 3
        case .scissors:
            return 6
        }
    }
}

func findTotalScorePart1() {
    let eachLines = data2.components(separatedBy: .newlines)
    
    var cummulativeSum = 0
    
    for eachLine in eachLines {
        let twoValues = eachLine.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces)
        
        let opponentValue = Character(twoValues.first ?? "")
        
        let yourValue = Character(twoValues.last ?? "")
        let yourScore = Scores.getScoresForPart1(for: yourValue)
        
        let outcomeScore = Scores.getWinningScoreForPart1(for: Shape(char: opponentValue), yourShape: Shape(char: yourValue)) + yourScore
        
        cummulativeSum += outcomeScore
    }
    
    print(cummulativeSum)
}


func findTotalScorePart2() {
    let eachLines = data2.components(separatedBy: .newlines)
    
    var cummulativeSum = 0
    
    for eachLine in eachLines {
        let twoValues = eachLine.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces)
        
        let opponentValue = Character(twoValues.first ?? "")
        
        let yourValue = Character(twoValues.last ?? "")
        let yourScore = Scores.getScoresForPart2(for: Shape(char: opponentValue), yourShape: Shape(char: yourValue))
        
        let outcomeScore = Scores.getWinningScoreForPart2(for: Shape(char: yourValue)) + yourScore
        
        cummulativeSum += outcomeScore
    }
    
    print(cummulativeSum)
}
