//关联类型：为协议定义范型 associatedtype
//协议是不允许直接使用尖括号 <> 定义范型的，只能使用关联类型
protocol Container {
    associatedtype ItemType: Equatable
    mutating func append(_ item:ItemType)//异变方法
    var count:Int {get}
    subscript(i:Int) -> ItemType {get}
}
protocol SuffixableContainer: Container {
    //约束可以遵循自身，也可以添加 where 子句来扩展增强约束
    associatedtype Suffix: SuffixableContainer where Suffix.ItemType == ItemType
}
struct IntStack: Container {
    var items = [Int]()
    mutating func append(_ item: Int) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
var intStack = IntStack()
intStack.append(1)
intStack.append(2)
print(intStack.count)
print(intStack[0])
//范型下标
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType] where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}
print(intStack[[0,1]])
