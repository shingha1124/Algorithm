//
//  Level2+60057.swift
//  Algorithm
//
//  Created by seongha shin on 2022/07/07.
//

import Foundation

class Level2_60057 {
    func start() {
        print(solution("a"))
    }
    
    private func solution(_ string: String) -> Int {
        var minLength = 10000
        
        if string.count <= 1 {
            return 1
        }
        
        (1...(string.count / 2)).forEach { count in
            var baseString = string
            var result = ""
            
            var startIndex = string.startIndex
            var endIndex = string.index(startIndex, offsetBy: count)
            var word = String(string[startIndex..<endIndex])
            
            var wordCount = 0
            
            while true {
                let hasPrefix = baseString.hasPrefix(word)
                if hasPrefix {
                    wordCount += 1
                    baseString = String(baseString[endIndex..<baseString.endIndex])
                } else {
                    result += (wordCount >= 2 ? "\(wordCount)\(word)" : word)
                    wordCount = 0
                    baseString = String(baseString[startIndex..<baseString.endIndex])
                }
                
                if baseString.isEmpty || baseString.count < word.count {
                    break
                }
                
                startIndex = baseString.startIndex
                endIndex = baseString.index(startIndex, offsetBy: word.count)
                
                if !hasPrefix {
                    word = String(baseString[startIndex..<endIndex])
                }
            }
            
            result += (wordCount >= 2 ? "\(wordCount)\(word)" : word)
            result += baseString
            minLength = min(minLength, result.count)
            print("\(count): \(result) / \(result.count)")
        }
        
        print(minLength)
        return minLength
    }
}


