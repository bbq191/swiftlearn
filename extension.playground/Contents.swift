//协议扩展 extension
extension Double {
    var km: Double {
        return self/1000.0
    }
}
let speed:Double = 1200.0
print(speed.km)//为 double 添加了一个 km 的扩展
//扩展方法
extension Int {
    func repeatTask(_ task: ()->()) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repeatTask {
    print(("hello"))
}
//下标扩展
extension Int {
    subscript(digitIndex: Int) -> Int {
        get {
            var base = 1
            for _ in 0..<digitIndex {
                base *= 10
            }
            return (self/base)%10
        }
    }
}
print(7654321[0])
//内嵌扩展
extension Int {
    enum Kind {
        case zero
        case negative
        case positive
    }
    var kind: Kind {
        get {
            switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
            }
        }
    }
}
print(8.kind)
print((-8).kind)
print(0.kind)
