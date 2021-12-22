//Dictionary 常见操作
var personDict = ["张":10,"王":19,"李":20]
personDict["赵"]=22
print(personDict)
personDict["张"]=33
print(personDict)
personDict["张"]=nil
print(personDict)

struct Person {
    var name: String
    var age: Int
}
extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
extension Person:Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}
var personDicts = [Person(name: "张", age: 13): 3000]
personDicts.updateValue(5000, forKey: Person(name: "张", age: 0))
print(personDicts)
//merging 不会改变原字典的值，会返回一个新字典，merge 会改变原字典
print(personDict.merging(["韩":2, "王":5], uniquingKeysWith: {(current, _) -> Int in current}))
print(personDict.merging(["韩":2, "王":5], uniquingKeysWith: {(_, new) -> Int in new}))
//通过 value 获取 index
let index = personDict.firstIndex{(_, value) -> Bool in value == 19
}
print(index ?? "不存在")
if let i = index {
    print(personDict[i].value)
}
//保持顺序 k:v 对
let kvs1: KeyValuePairs = ["a":1,"b":2,"c":3]
let kvs2 = ["a":1,"b":2,"c":3]
print(kvs1,kvs2)
