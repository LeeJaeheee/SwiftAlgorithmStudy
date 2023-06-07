// https://school.programmers.co.kr/learn/courses/30/lessons/138476

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int: Int] = [:]
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    if tangerine.count == k {
        return dict.count
    }
    var result = 0
    var count = 0
    for d in dict.values.sorted(by: > ) {
        count += d
        result += 1
        if count >= k {
            break
        }
    }
    return result
}

// 수정한 코드
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    if tangerine.count == k {
        return Set(tangerine).count
    }
    var dict: [Int: Int] = [:]
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    var result = 0
    var count = 0
    for d in dict.values.sorted(by: > ) {
        count += d
        result += 1
        if count >= k {
            break
        }
    }
    return result
}
