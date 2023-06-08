// https://school.programmers.co.kr/learn/courses/30/lessons/172928

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    // 방향별로 한 칸씩의 이동 좌표 미리 저장해놓은 딕셔너리
    let opDict = ["N": [-1, 0], "S": [1, 0], "W": [0, -1], "E": [0, 1]]
    let (h, w) = (park.count, park[0].count)
    var result = [0, 0]
    
    // 문자열은 인덱스로 접근 어려우므로 이차원 배열로 만드는 동시에 시작점 찾기
    var board: [[String]] = Array(repeating: [], count: h)
    for (i, park) in park.enumerated() {
        for (j, p) in park.enumerated() {
            if p == "S" { result = [i, j] }
            board[i].append(String(p))
        }
    }

    for route in routes {
        let route = route.components(separatedBy: " ")
        let (op, n) = (route[0], Int(route[1])!)
        let dict = opDict[op]!
        var (row, col, isTrue) = (result[0], result[1], true)
        
        // opDict에서 찾아온 값으로 한 칸씩 이동하면서 조건 체크
        for _ in 0..<n {
            row += dict[0]
            col += dict[1]
            if !(0..<h ~= row && 0..<w ~= col && board[row][col] != "X") {
                isTrue = false
                break
            }
        }
        result = isTrue ? [row, col] : result
    }
    return result
}
