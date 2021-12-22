//function
func greet(person: String) -> String {
    "hello" + person + "!"
}
print(greet(person: "007"))

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var minvalue=array[0]
    var maxvalue=array[0]
    for value in array {
        if value < minvalue {
            minvalue = value
        }
        if value > maxvalue {
            maxvalue = value
        }
    }
    return (minvalue,maxvalue)
}
if let minMaxValue = minMax(array: [1,2,9,0,8,7]) {
    print(minMaxValue)
    print("min is \(minMaxValue.min), max is \(minMaxValue.max)")
}
