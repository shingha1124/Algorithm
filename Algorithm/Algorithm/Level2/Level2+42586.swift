//
//  Level2+42586.swift
//  Algorithm
//
//  Created by seongha shin on 2022/07/07.
//

import Foundation

class Level2_42586 {
    func start() {
//        print(solution([93, 30, 55], [1, 30, 5]))
        print(solution1([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
    }
    
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        
        let finishDays = zip(progresses, speeds)
            .map { (100 - $0) / $1 }
        
        var result = [Int]()
        var value = 0
        var checkDay = 0
        
        finishDays.forEach { day in
            if checkDay < day {
                result.append(value)
                value = 1
                checkDay = day
            } else {
                value += 1
            }
        }
        result.append(value)
        return Array(result.dropFirst())
    }
    
    func solution1(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        return zip(progresses, speeds)
            .map { (100 - $0 + ($1 - 1)) / $1 }
            .reduce(([], 0), { tuple, day -> ([Int], Int) in
                let (list, lastMax) = tuple
                guard let lastCount = list.last else {
                    return ([1], day)
                }
                
                if lastMax >= day {
                    return (list.dropLast() + [lastCount + 1], lastMax)
                }
                
                return (list + [1], day)
            }).0
    }
}
