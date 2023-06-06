// https://school.programmers.co.kr/learn/courses/30/lessons/12946

import Foundation

func move(_ n: Int, _ first: Int, _ second: Int, _ third: Int) -> [[Int]] {
    if n == 1 {
        return [[first, third]]
    }
    var result: [[Int]] = []
    result += move(n-1, first, third, second)
    result += [[first, third]]
    result += move(n-1, second, first, third)
    return result
}

func solution(_ n:Int) -> [[Int]] {
    return move(n, 1, 2, 3)
}
