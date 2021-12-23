//High order func 高阶函数
let nums = [1,2,3,10]
print(nums.map({$0*11}))
print(nums.filter({$0>4}))
print(nums.reduce(100) {$0+$1})
//flatmap
let array = [[1,2,3],[4,5,6],[7,8,9]]
print(array.flatMap{$0})
print(array.flatMap{$0.map{$0*10}})
//
let names = ["a",nil,"b",nil,"c"]
print(names.compactMap{$0})
print(names.compactMap{$0?.count})
