import UIKit
//array 遍历和索引
//除了常用的 for in 还可以使用 forEach
let nums = Array(0...7)
nums.forEach {(num) in
    if num == 3 {
        return
    }
    print(num)
}
//enumerated 遍历
for (index, num) in nums.enumerated() {
    print("this index is \(index)")
    print(num)
}
//iterator 遍历
var it = nums.makeIterator()
while let num = it.next() {
    print(num)
}
//使用索引区间遍历
for i in nums.indices {
    print("index: \(i)")
    print(nums[i])
}

//查找
let array = [10,20,30,45,101,4]
print(array.contains(30))
//其中的 $0 表示所有数组中的元素。比如：下面就是所有数组元素是否包含有小于 30 的元素
print(array.contains(where: {$0<30}))
print(array.allSatisfy({$0>0}))
print(array.first(where: {$0>100}) ?? "不存在")
print(array.firstIndex(where: {$0>125}) ?? "不存在")
let errors = [(1,"p"), (2,"a"), (3,"c")]
print(errors.min(by: {(a,b) -> Bool in a.1<b.1}) ?? "无法比较")
print(errors.max(by: {(a,b) -> Bool in a.1<b.1}) ?? "无法比较")

//改变数组，以增加为例，删除类似
var numbers = [Int](2...7)
numbers.append(100)
print(numbers)
numbers.insert(-1, at: 0)
print(numbers)
numbers.insert(contentsOf: 10...13, at: 1)
print(numbers)
//keepingCapacity: true 可以保留空间，当再次添加元素的时候不需要扩容而直接使用
numbers.removeAll(keepingCapacity: true)
print(numbers)
print(numbers.capacity)
