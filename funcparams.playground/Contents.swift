//方法的各种参数形式
func addTwoNum1(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
print(addTwoNum1(num1: 1, num2: 2))
//参数标签
func addTwoNum2(first num1: Int, num2: Int) -> Int {
    return num1 + num2
}
print(addTwoNum2(first: 1, num2: 2))
//省略参数标签
func addTwoNum3(num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
print(addTwoNum3(num1: 1, 2))
//默认参数
func addTwoNum4(_ num1: Int, _ num2: Int = 0) -> Int {
    return num1 + num2
}
print(addTwoNum4(1,2))//传两个
print(addTwoNum4(1))//只传一个
//可变参数
func addTwoNum5(num1: Int...) -> Int {
    var sum = 0
    for num in num1 {
        sum += num
    }
    return sum
}
print(addTwoNum5(num1: 1, 2,3,4,5,6,7))
//输入输出参数
var number=1
var otherNumber=2
//有 inout 关键字修饰
func swapValue(_ a:inout Int, _ b:inout Int) {
    let temp = a
    a = b
    b = temp
}
swapValue(&number, &otherNumber)//注意用 & 符号
print(number)
print(otherNumber)
