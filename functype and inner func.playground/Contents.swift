//函数类型及内嵌函数
var number=1
var otherNumber=2
//有 inout 关键字修饰
func swapValue(_ a:inout Int, _ b:inout Int) {
    let temp = a
    a = b
    b = temp
}
//这里需要注意，有 inout 修饰的参数必须也要 inout 修饰
//另外没有返回值的函数不是返回 void 而是用 ()
//let swapFunc: (Int,Int) -> Void = swapValue //Cannot convert value of type '(inout Int, inout Int) -> ()' to specified type '(Int, Int) -> Void'
let swapFunc: (inout Int, inout Int) -> () = swapValue
swapValue(&number, &otherNumber)
print(number)
print(otherNumber)
//内部函数
func chooseStep(backward: Bool) -> (Int) -> Int {
    func stepForward(step: Int) -> Int{ step + 1 }
    func stepBackward(step: Int) -> Int { step - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = 5
//内部函数被封装使得外部函数调用的时候不用知道内部细节
let stepFunc = chooseStep(backward: currentValue > 0)
while currentValue != 0 {
    currentValue = stepFunc(currentValue)
}
print(currentValue)
//函数作为参数
func add(a: Int,b:Int) -> Int { a + b }
func mutil(a:Int,b:Int) -> Int { a * b }
func printResult(_ mathFunc:(Int,Int) -> Int, _ a:Int, _ b:Int) {
    print(mathFunc(a,b))
}
printResult(add, 3, 4)
printResult(mutil, 3, 4)
