// https://school.programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {

    // [코스메뉴 개수(n): [길이 n인 메뉴 조합: 모든 주문에서 찾아낸 해당 조합의 개수]]
    var dict: [Int: [Set<String>: Int]] = [:]

    // arr에서 c개를 뽑는 모든 경우의 수를 구해 dict에 넣어주는 함수
    func getCombi(_ arr: [String], _ c: Int, _ index: Int, _ a : [String]) {
        if a.count == c {
            dict[c, default:[:]][Set(a), default: 0] += 1
            return
        }
        if index < 0 { return }
        getCombi(arr, c, index-1, a+[arr[index]])
        getCombi(arr, c, index-1, a)
    }

    // 각 order별로 course에서 주어진 개수에 맞는 모든 조합 구해서 dict에 저장
    for order in orders {
        for c in course.filter {$0 <= order.count} {
            getCombi(order.map{String($0)}, c, order.count-1, [])
        }
    }

    // 코스메뉴 개수별로 가장 많이 함께 주문된 메뉴 구성 뽑아서 result에 삽입
    var result: [String] = []
    for k in dict.keys.sorted() {
        let max = dict[k]!.values.max()!
        if max >= 2 {
            result += dict[k]!.filter{$0.1 == max}.map{$0.0.sorted().joined()}
        }
    }

    return result.sorted()
}
