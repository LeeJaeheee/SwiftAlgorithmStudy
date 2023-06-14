// https://school.programmers.co.kr/learn/courses/30/lessons/17686

func solution(_ files:[String]) -> [String] { 
    // (head, number, index) 배열
    var arr: [(h: String, n: Int, i: Int)] = []
    
    for (i, file) in files.enumerated() {
        // head와 strnum 찾고 tail 영역이 되면 flag가 true이므로 바로 for문 탈출 
        var (head, strnum, flag) = ("", "", false)
        for f in file {
            if !f.isNumber {
                if flag == true { break }
                head += String(f)
            } else {
                flag = true
                strnum += String(f)
            }
        }
        // head의 대소문자 구분하지 않으므로 소문자로 변환
        arr += [(head.lowercased(), Int(strnum)!, i)]
    }
    
    // 주어진 조건대로 head->number->index 순으로 정렬 후 반환
    return arr
        .sorted { $0.h != $1.h ? $0.h<$1.h : ($0.n != $1.n ? $0.n < $1.n : $0.i < $1.i)}
        .map {files[$0.i]}
}
