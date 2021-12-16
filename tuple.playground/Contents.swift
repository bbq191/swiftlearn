import UIKit

//tuple 的定义
let errorInfo1 = (errorCode: 1, errorMessage: "没有权限")
print(errorInfo1.errorCode)
print(errorInfo1.errorMessage)

//tuple 的赋值
var errorInfo2 = (errorCode: 1, errorMessage: "没有权限")
errorInfo2.errorCode = 0
print(errorInfo2) //(errorCode: 0, errorMessage: "没有权限")
//cannot assign value of type 'Int' to type 'String'
//errorInfo2.errorMessage = 3
//如果需要变更类型的赋值，需要显示声明为 Any
var errorInfo3:(errorCode:Int, errorMessage:Any) = (errorCode: 1, errorMessage: "没有权限")
errorInfo3.errorMessage = 2
print(errorInfo3) //(errorCode: 1, errorMessage: 2)

//tuple 的分解
let errorInfo4 = (1,"没有权限")
let (errorCode, errorMessage) = errorInfo4
print(errorCode) //1
print(errorMessage) //没有权限

//tuple 作为函数返回值
func writeFile(content:String) -> (errorCode:Int, errorMessage:String) {
    return(1,"没有权限")
}
let error = writeFile(content: "")
print(error) //(errorCode: 1, errorMessage: "没有权限")
