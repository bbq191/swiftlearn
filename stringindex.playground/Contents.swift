import UIKit

//字符串的索引访问
var greeting = "Hello, playground"
print(greeting[greeting.startIndex])
print(greeting[greeting.index(before: greeting.endIndex)])
//插入一个字符
greeting.insert("!", at:greeting.endIndex)
print(greeting)
//插入一段字符串
greeting.insert(contentsOf: "!!!", at: greeting.index(before: greeting.endIndex))
print(greeting)
//删除一个字符
greeting.remove(at: greeting.index(before: greeting.endIndex))
print(greeting)
//删除指定字符串
let range = greeting.index(greeting.endIndex, offsetBy: -15)..<greeting.endIndex
greeting.removeSubrange(range)
print(greeting)
