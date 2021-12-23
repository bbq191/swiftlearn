//闭包
//函数版逆序排
let names = ["蒋","沈","韩","杨"]
func backward (_ s1:String, _ s2:String) -> Bool { s1 > s2 }
var reversed = names.sorted(by: backward)
print(reversed)
//闭包版逆序排列
var reversedClosure = names.sorted(by: {(s1:String, s2:String) -> Bool in s1 > s2})
print(reversedClosure)
//swift 会自动推断，可以简洁的写为
var reversedSimple = names.sorted(by: {s1,s2 in s1>s2})
print(reversedSimple)
//swift 可以对行内闭包提供简写参数名，以 $0, $1 等替代
var reversedSimpler = names.sorted(by: {$0>$1})
print(reversedSimpler)
//由于 String 类型的 > 号正好与 sorted(by:) 参数需要的函数匹配，所以可以更精简
var reversedSimplest = names.sorted(by: > )
print(reversedSimplest)

//尾随闭包，闭包表达式作为函数最后一个参数的话，可以省略 ()
var reversedLast = names.sorted{$0>$1}
print(reversedLast)

//闭包捕获值
func makeIncrementer(amount: Int) -> () -> Int {
    var total = 0
    func incrementer() -> Int {
        total += amount
        return total
    }
    return incrementer
}
let increByTen = makeIncrementer(amount: 10)
print(increByTen())
//注意：每个闭包都是独立的，值并不会从 10 开始
let increBySeven = makeIncrementer(amount: 7)
print(increBySeven())
//但是闭包赋值是引用传递的，比如这里就是从 10 开始递进
let anotherIncreByTen = increByTen
print(anotherIncreByTen())
