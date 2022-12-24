//
//  Logic7.swift
//  Advant-2022
//
//  Created by Roshan sah on 11/12/22.
//

import Foundation

private class File {
    let name: String
    let size: String
    init(name: String, size: String) {
        self.name = name
        self.size = size
    }
}

private class Folder {
    let name: String
    var folders = [Folder]()
    var files = [File]()
    
    init(name: String) {
        self.name = name
    }
}

private func getCommand(in eachLine: String ) -> String {
    let patterns = ["^\\$ cd /$", "^\\$ cd", "^\\$ cd ..$", "^\\$ ls$", "dir"]
    var command = ""
    for eachPattern in patterns {
        let regex = try? NSRegularExpression(pattern: eachPattern, options: .caseInsensitive)
        if let firstMatch = regex?.firstMatch(in: eachLine, options: .anchored, range: NSRange(0..<eachLine.utf16.count)) {
            if let stringRange = Range(firstMatch.range, in: eachLine) {
                command = String(eachLine[stringRange])
            }
        }
    }
    
    return command
}
func findTotalSizePart1() {
    let lines = tempData7.components(separatedBy: .newlines)
    
    var root = Folder(name: "/")
    var currentFolder: Folder?
    for var eachLine in lines {
        let command = getCommand(in: eachLine)
        
        if command == "$ cd /" || command == "$ ls" {
            continue
        }
        eachLine = eachLine.replacingOccurrences(of: command, with: "").trimmingCharacters(in: .whitespaces)
        if command != "" {
            switch command {
            case "dir":
                let folder = Folder(name: eachLine)
                if currentFolder == nil {
                    root.folders.append(folder)
                } else {
                    currentFolder?.folders.append(folder)
                }
                
            case "$ cd ..":
                for eachFolder in root.folders {
                    if eachFolder.folders.contains(where: {$0.name == currentFolder?.name}) {
                        currentFolder = root.folders.first(where: {$0.name == eachFolder.name})
                        break
                    }
                }
            case "$ cd":
                print("move into \(eachLine)")
                if currentFolder == nil {
                    currentFolder = root.folders.first(where: {$0.name == eachLine})
                } else {
                    currentFolder = currentFolder?.folders.first(where: {$0.name == eachLine})
                }
                
            default:
                break
            }
        } else {
            let components = eachLine.components(separatedBy: .whitespaces)
            let file = File(name: components.last ?? "", size: components.first ?? "")
            if currentFolder == nil {
                root.files.append(file)
            } else {
                currentFolder?.files.append(file)
            }
        }
        
    }
    
}

func findTotalSizePart2(){}
