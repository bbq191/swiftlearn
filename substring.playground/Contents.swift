import UIKit

//子字符串
var greeting = "Hello, playground"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let subString = greeting[..<index]
print(subString)
//以上得到的是 substring 类型，需要通过 String 类型接收它
let newString = String(subString)
print(newString)
//字符串的前后缀比较
print(greeting.hasPrefix("He"))
print(greeting.hasSuffix("und"))
