//范型 大写开头的驼峰命名法
func firstIndex<T: Equatable>(of valueToFind:T, in array:[T]) -> Int? {
    for(index,value) in array.enumerated(){
        //T 遵循了 equable 协议，才能使用 == 比较操作
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let names = ["张三","李四","王五"]
print(firstIndex(of: "李四", in: names) ?? "无法匹配")
//范型的意义在于适用于所有遵循 equable 协议的数组
let nums = [7,6,4,0]
print(firstIndex(of: 0, in: nums) ?? "无法匹配")
