//
//  Level2+72410.swift
//  Algorithm
//
//  Created by seongha shin on 2022/07/07.
//

import Foundation

//https://school.programmers.co.kr/learn/courses/30/lessons/72410?language=swift
class Level2_72410 {
    func start() {
        print(solution("abcdefghijklmn.p"))
    }
    
    private func solution(_ new_id: String) -> String {
        
        if (1...1000).contains(new_id.count) == false {
            return ""
        }
        var resultId = new_id
        resultId = replaceLowercased(id: resultId)
        resultId = removeInVaild(id: resultId)
        resultId = replaceContinueCommaToOne(id: resultId)
        resultId = removeCommaFirstAndLast(id: resultId)
        resultId = replaceAIfEmpty(id: resultId)
        resultId = removeLongString(id: resultId)
        resultId = repeatLastToThreeLength(id: resultId)
        return resultId
    }
    
    private func replaceLowercased(id: String) -> String {
        id.lowercased()
    }
    
    private func removeInVaild(id: String) -> String {
        id.replacingOccurrences(of: "[^0-9a-z._-]", with: "", options: .regularExpression)
    }
    
    private func replaceContinueCommaToOne(id: String) -> String {
        var result = id
        while result.contains("..") {
            result = result.replacingOccurrences(of: "..", with: ".")
        }
        
        return result
    }
    
    private func removeCommaFirstAndLast(id: String) -> String {
        var result = id
        if result.first == "." {
            result.removeFirst()
        }
        
        if result.last == "." {
            result.removeLast()
        }
        
        return result
    }
    
    private func replaceAIfEmpty(id: String) -> String {
        id.isEmpty ? "a" : id
    }
    
    private func removeLongString(id: String) -> String {
        if id.count >= 16 {
            let text = String(id.dropLast(id.count - 15))
            return text.last == "." ? String(text.dropLast()) : text
        }
        return id
    }
    
    private func repeatLastToThreeLength(id: String) -> String {
        var result = id
        while result.count < 3 {
            result += String(result.last!)
        }
        
        return result
    }
}
