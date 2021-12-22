let course: Set = ["语文","数学","英语"]
for c in course {
    print(c) //无序
}
//排序
for c in course.sorted() {
    print(c)
}
//插入删除
//由于 Set 必须是可 hash 的，所以自定义类型必须实现它的 hash 方法
struct Person {
    var name: String
    var age: Int
}
extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool{
        return lhs.name == rhs.name
    }
}
var personSet: Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 18)]
//有相通元素会更新，没有会添加
personSet.update(with: Person(name: "zhangsan", age: 28))
personSet.update(with: Person(name: "wangwu", age: 40))
print(personSet)
let person = personSet.removeFirst()
print(personSet)
print(person)
//filter 会返回一个新的 set 集合
print(personSet.filter({$0.age < 20}))

//交集，并集，对称差集，相对补集
let a: Set<Character> = ["a","b","c"]
let b: Set<Character> = ["c","d","e","f"]
print(a.intersection(b))
print(a.union(b))
print(a.symmetricDifference(b))
//相对补集不支持交换律
print(a.subtracting(b))
print(b.subtracting(a))
//子集超集判断
let c: Set<Character> = ["a","b","c"]
let d: Set<Character> = ["a","b","c","e"]
print(c.isSubset(of: d))
print(c.isStrictSubset(of: d))//真子集
print(c.isDisjoint(with: d))//判断是否有公共元素，有则返回 false
