import UIKit

//string 声明
var greeting = "Hello, playground"
var str1 = String()
//多行字符串
var mutiLine = """
Hello
world
    "new indent"
"""
print(greeting)
print(str1)
print(mutiLine)
//Raw String 扩展字符串分隔符，转义就会失效
let str2 = #"a\nb\nc"#
print(str2)
//如果 string 中有 # 等特殊字符，那么只需要首尾 # 一致即可，如果也需要转义字符生效，那么也是添加同等 # 号
let str3 = ##"a#b\##nc"##
print(str3)
//字符串是值传递
var welcome1 = "hello"
var welcome2 = "hello"
var welcome3 = welcome1
print(welcome1 == welcome2)
print(welcome1 == welcome3)
print(welcome2 == welcome3)
welcome3 += " world!"
print(welcome1, welcome2, welcome3)
//字符串插值
let number = 3
print("\(number) is number, 3/6=\(Double(number) / 6)")
