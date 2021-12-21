//溢出运算符，就像一个轮回
let num1: Int8 = -128
let num2: Int8 = 127
//算术运算会报错
//print(num1 - 1)
//print(num2 + 1)
//溢出运算不会
print(num1 &- 1) //成了最大正数 127
print(num2 &+ 1) //成了最小负数 -128

//合并空值运算符，类似三元运算符
let a: Int? = nil
let b: Int? = 3
print(a ?? b as Any)
func addTwoNum(num1: Int?, num2: Int?) -> Int {
    //没有合并运算控制符，需要各种判断
    if num1 != nil {
        if num2 != nil {
            return num1! + num2!
        } else {
            return num1!
        }
    } else {
        if num2 != nil {
            return num2!
        } else {
            return 0
        }
    }
}
print(addTwoNum(num1: a, num2: b))
func addTwoNumOp(num1: Int?, num2: Int?) -> Int {
    return (num1 ?? 0) + (num2 ?? 0)
}
print(addTwoNumOp(num1: a, num2: b))

//区间运算符
//1...n 闭区间，包含 1 到 n，1..<n 包含 1 到 n-1
//...n 只有一边的是单侧区间
let names = ["赵","钱","孙","李","周","吴","郑","王"]
for name in names[..<5] {
    print(name)
}
//区间运算用于 comparable 类型
var str = "hello, world"
let range = "a"..."z"
for c in str {
    if !range.contains(String(c)) {
        print("“\(c)” 不是小写字母")
    }
}
//倒排索引
for i in (0...10).reversed() {
    print(i)
}
