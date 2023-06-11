// https://school.programmers.co.kr/learn/courses/30/lessons/17677

func solution(_ str1:String, _ str2:String) -> Int {
    let (arr1, arr2) = (str1.lowercased().map {$0}, str2.lowercased().map {$0})
    var dict1: [String: Int] = [:]
    var dict2: [String: Int] = [:]
    
    func getDict(_ arr: [Character], _ dict: inout [String: Int]) {
        for (i, a) in arr.enumerated() {
            if i == arr.count-1 { break }
            if arr[i].isLetter && arr[i+1].isLetter {
                dict[String(arr[i]) + String(arr[i+1]), default: 0] += 1
            }
        }
    }
    getDict(arr1, &dict1)
    getDict(arr2, &dict2)
    
    var inter = Set(dict1.keys).intersection(Set(dict2.keys))
    var union = Set(dict1.keys).union(Set(dict2.keys))

    var iCount = inter.reduce(0, {$0 + min(dict1[$1]!, dict2[$1]!)})
    var uCount = union.reduce(0, {$0 + max(dict1[$1] ?? 0, dict2[$1] ?? 0)})
    
    return uCount == 0 ? 65536 : Int(Double(iCount) / Double(uCount) * 65536)
}

// (intersection) https://developer.apple.com/documentation/swift/set/intersection(_:)-6uts9
// (union) https://developer.apple.com/documentation/swift/set/union(_:)
