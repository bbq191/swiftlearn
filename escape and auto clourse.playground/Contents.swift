var names = ["a","b","c","d"]
//闭包的延时性
let clourse = {names.remove(at: 0)}
print(names.count)//这个时候 name 还是 4
print(clourse())//只有执行完闭包之后，names 才会变
print(names.count)
var providers:[() -> String] = []
//传递给函数的闭包是在函数调用之后才去调用的就需要使用逃逸 @escaping
//常用场景就是等待网络调用
func collect(provider: @escaping () -> String) {
    providers.append(provider)
}
collect(provider: {names.remove(at: 0)})
//自动闭包
func collect1(provider: @autoclosure @escaping () -> String) {
    providers.append(provider)
}
collect1(provider: names.remove(at: 0))
print(names.count)//这时的 names 依然是 4
//需要等待 provider 闭包执行以后，names 才会变
for provider in providers {
    print(provider())
}
print(names.count)
//在逃逸闭包中访问属性需要使用 self
class Some {
    var x: String = "hello"
    func doSomthing() {
        collect1(provider: self.x)
//        collect1(provider: x) //Reference to property 'x' in closure requires explicit use of 'self' to make capture semantics explicit
    }
}
