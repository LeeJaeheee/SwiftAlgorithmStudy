// https://school.programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageDict: [Int: Double] = [:]
    stages.forEach { stageDict[$0, default: 0] += 1 }
    
    var userCount = Double(stages.count)
    var failed: [Int: Double] = [:]
    for i in 1...N {
        let fails = (stageDict[i] ?? 0)
        failed[i] = userCount <= 0 ? 0 : fails / userCount
        userCount -= fails
    }

    return failed.sorted { $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 }.map { $0.0 }
}
