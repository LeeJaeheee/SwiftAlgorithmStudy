// https://school.programmers.co.kr/learn/courses/30/lessons/42579

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    // 각 장르에 해당하는 노래들의 [인덱스: 재생횟수]를 value로 가지는 딕셔너리
    var dict: [String: [Int: Int]] = [:]
    // 각 장르별 재생 횟수 총합
    var sumPlays: [String: Int] = [:]
    
    for i in 0..<genres.count {
        dict[genres[i], default: [:]][i] = plays[i]
        sumPlays[genres[i], default: 0] += plays[i]
    }
    
    var result: [Int] = []
    // 속한 노래가 많이 재생된 장르 순으로 정렬
    for s in sumPlays.sorted { $0.1 > $1.1 } {
        // 해당 장르의 [인덱스: 재생횟수]
        var info = dict[s.0]!
        // 장르에 속한 곡이 하나라면, 하나의 곡만 선택
        if info.count == 1 {
            result += info.keys
        } else {
            // 재생 횟수 많은 순으로 정리하되, 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래 순으로 정렬
            result += info.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }[0...1].map { $0.0 }
        }
    }
    return result
}
