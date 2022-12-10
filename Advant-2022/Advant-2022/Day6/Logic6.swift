//
//  Logic6.swift
//  Advant-2022
//
//  Created by Roshan sah on 09/12/22.
//

import Foundation


func findFirstMarkerInString(forSize size: Int) {
    var characters = [Character]()
    
    for (index, char) in data6.enumerated() {
        
        guard characters.count == size else {
            
            if let firstIndex = characters.firstIndex(of: char) {
                (0...firstIndex).forEach { _ in
                    characters.removeFirst()
                }
            }
            characters.append(char)
            continue
        }
        
        print(index)
        break
        
    }
}
