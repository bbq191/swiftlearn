import UIKit

//optional 定义及展开方式
let str: String? = "abc"
//Value of optional type 'String?' must be unwrapped to refer to member 'count' of wrapped base type 'String'
//let count = str.count
//判断展开
if str != nil {
    let count = str!.count
    print(count)
}
//绑定可选项
if let actureStr = str {
    let count = actureStr.count
    print(count)
}
//强制展开 - 不推荐
//因为如果运算为 nil，强制展开就会抛错
let count = str!.count
print(count)
//隐式展开
let str2:String! = "abc"
let count2 = str2.count
print(count2)
//可选链
let count3 = str?.count
//可选链调研的值也是可选值，不能直接使用，如下
//let lastCount = count3 - 1 //Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
//所以使用可选链获得的值也需要非空判断
if count3 != nil {
    let lastCount = count3! - 1
    print(lastCount)
}

//optional 原理探究
//optional 本质是范型的包装类
//Optional.none 就是 nil，Optional.some 包装了实际的值
let opStr: Optional<String> = "abc"
if let actureStr = opStr {
    let count = actureStr.count
    print(count)
}
//判断非空后，直接使用 unsafelyUnwrapped 展开
if opStr != nil {
    let count = opStr.unsafelyUnwrapped.count
    print(count)
}
