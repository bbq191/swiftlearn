//协议
protocol Named {
    var name:String {get}//get 表示可读属性，set 是可写属性
}
protocol Aged {
    var age:Int {get}
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
let p = Person(name: "zhangsan", age: 30)
//参数 to 是协议组合类型
func wish(to: Named & Aged) {
    print("name \(to.name) is age \(to.age)")
}
wish(to: p)

//扩展及协议组合使用
protocol TextRepresentable {
    var desc:String{get}
}
extension Person: TextRepresentable {//扩展里面定义必须遵循的协议
    var desc: String {
        return "name \(name) is age \(age)"
    }
}
print(p.desc)//直接使用协议属性
//条件协议扩展，用协议约束属性
extension Array: TextRepresentable where Element: TextRepresentable {
    var desc: String {
        let itemDesc = self.map{$0.desc}
        return itemDesc.joined(separator: ", ")
    }
}
let array = [Person(name: "zhangsan", age: 20),Person(name: "lisi", age: 20)]
print(array.desc)
//协议扩展协议 Collection 本身是个协议，它的每个元素扩展了 TextRepresentable 协议
extension Collection where Iterator.Element: TextRepresentable {
    var desc: String {
        let itemDesc = self.map{$0.desc}
        return itemDesc.joined(separator: ", ")
    }
}
let arrayColl = [Person(name: "zhangsan", age: 20),Person(name: "lisi", age: 20)]
print(arrayColl.desc)
