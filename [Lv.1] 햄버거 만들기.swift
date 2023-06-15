// https://school.programmers.co.kr/learn/courses/30/lessons/133502

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var arr: [Int] = []
    var count = 0
    
    for i in ingredient {
        arr.append(i)
        let len = arr.count 
        
        if len >= 4 && i == 1 && arr[len-4...len-1] == [1,2,3,1] {
            arr.removeLast(4)
            count += 1
        }
    }
    
    return count
}
