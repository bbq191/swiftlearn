//数组切片
var nums = [1,2,3,4,99,70]
var slice = nums.drop(while: {$0<70})
print(slice)
//数组和切片共享内存，但值相互独立互不影响
nums.append(111)
print(nums)
slice.append(123)
print(slice)
//数组和 slice 不可以直接赋值，不是同一种类型，但可以用初始化器初始化
//var numbers: [Int] = slice //Cannot convert value of type 'Array<Int>.SubSequence' (aka 'ArraySlice<Int>') to specified type '[Int]'
var nums1:[Int] = Array(slice)
print(nums1)

//重排操作
var array = [Int](1...9)
let array2 = array.shuffled()
//shuffled 重排不会影响原数组，返回一个新数组
array.shuffle()
print("shuffle: ",array)
print("shuffled: ", array2)
array.reverse()
print("reverse: ",array)
//reversed 返回 array 逆序的表示
let array3 = array.reversed()
print("reversed: ", array3)
print("reversed 元素遍历结果")
for i in array3 {
    print(i)
}
//partition 重排数组会按条件把数组放到前后两段，但不会排序
var numbers = [10,2,25,30,44,62,100,30,79]
let index = numbers.partition(by: {$0>30})
print(index)
print(numbers)
//根据 index 把数组分为两个
let p1 = numbers[..<5]
let p2 = numbers[5...]
print(p1,p2)
//swapAt 交换两个值
numbers.swapAt(numbers.startIndex, numbers.endIndex-1)
print(numbers)
