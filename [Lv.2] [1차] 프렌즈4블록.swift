// https://school.programmers.co.kr/learn/courses/30/lessons/17679

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var newBoard: [[String]] = Array(repeating: [], count: n)
    for bo in board.reversed() {
        for (i, b) in bo.enumerated() {
            newBoard[i].append(String(b))
        }
    }
    while true {
        var matched = 0
        var nextBoard = newBoard
        for (i, nb) in newBoard.enumerated() {
            if i == n-1 {
                break
            }
            for (j, b) in nb.enumerated() {
                if j == nb.count-1 || j >= newBoard[i+1].count-1 {
                    break
                }
                let match = Array(Set([newBoard[i][j], newBoard[i][j+1], newBoard[i+1][j], newBoard[i+1][j+1]]))
                if match.count == 1 {
                    matched += 1
                    nextBoard[i][j] = "0"   
                    nextBoard[i][j+1] = "0"
                    nextBoard[i+1][j] = "0"
                    nextBoard[i+1][j+1] = "0"
                }
            }
        }
        if matched == 0 {
            break
        }
        for i in (0..<n) {
            nextBoard[i].removeAll {$0 == "0"}
        }
        newBoard = nextBoard
    }
    return m*n - newBoard.reduce(0, {$0 + $1.count})
}
