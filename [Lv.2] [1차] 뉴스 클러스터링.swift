// https://school.programmers.co.kr/learn/courses/30/lessons/17677

func solution(_ str1:String, _ str2:String) -> Int {
    // str1, str2를 소문자로 치환해서 arr1, arr2 배열에 넣어준다.
    let (arr1, arr2) = (str1.lowercased().map {$0}, str2.lowercased().map {$0})
    var dict1: [String: Double] = [:]
    var dict2: [String: Double] = [:]
    
    // 각각의 두개로 잘려진 문자열을 key로 하고, 그 개수를 value로 하는 딕셔너리에 담는다.
    func getDict(_ arr: [Character], _ dict: inout [String: Double]) {
        for i in 0..<arr.count-1 {
            if arr[i].isLetter && arr[i+1].isLetter {
                dict[String(arr[i]) + String(arr[i+1]), default: 0] += 1
            }
        }
    }
    getDict(arr1, &dict1)
    getDict(arr2, &dict2)
    
    // 딕셔너리의 키값들을 셋으로 치환해 교집합, 합집합을 구한다.
    var inter = Set(dict1.keys).intersection(Set(dict2.keys))
    var union = Set(dict1.keys).union(Set(dict2.keys))

    // 교집합은 min값을, 합집합은 max값을 더해준다.
    var iCount = inter.reduce(0, {$0 + min(dict1[$1]!, dict2[$1]!)})
    var uCount = union.reduce(0, {$0 + max(dict1[$1] ?? 0, dict2[$1] ?? 0)})
    
    // 합집합이 공집합일 경우 자카드 유사도를 1로 정의
    return Int((uCount == 0 ? 1 : iCount / uCount) * 65536)
}

// (intersection) https://developer.apple.com/documentation/swift/set/intersection(_:)-6uts9
// (union) https://developer.apple.com/documentation/swift/set/union(_:)
