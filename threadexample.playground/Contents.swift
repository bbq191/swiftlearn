//典型场景
//一个页面有三个网络请求，需要在三个网络请求都返回的时候刷新界面
//多线程下载器，多个下载任务，每个任务可以保存当下字节数、总字节数，可以设置回调得到当下下载进度
//需要在主线程等待一个一步任务返回才能继续执行后续逻辑，但是又不希望阻塞用户事件

//实现一个线程安全的 Array 的读和写
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let queue1 = DispatchQueue(label: "myQueue1", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
let queue2 = DispatchQueue(label: "myQueue2", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
let queue3 = DispatchQueue(label: "myQueue3", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
var array = Array(1...10000)
//会溢出，因为线程不安全
func getLastItem() -> Int? {
    if array.count > 0 {
        return array[array.count-1]
    }
    return nil
}
func removeLastItem() {
    array.removeLast()
}
queue1.async {
    for _ in 0..<10000 {
        removeLastItem()
    }
}
queue2.async {
    for _ in 0..<10000 {
        print(getLastItem() ?? "不存在元素")
    }
}
//lock 版
let lock = NSLock()
func getLastItemLock() -> Int? {
    lock.lock()
    var temp: Int? = nil
    if array.count > 0 {
        temp = array[array.count-1]
    }
    lock.unlock()
    return temp
}
func removeLastItemLock() {
    lock.lock()
    array.removeLast()
    lock.unlock()
}
queue1.async {
    for _ in 0..<10000 {
        removeLastItemLock()
    }
}
queue2.async {
    for _ in 0..<10000 {
        if let item = getLastItemLock() {
            print(item)
        }
    }
}
//避免频繁读写
func getLastItemSync() -> Int {
    return queue3.sync { () -> Int in
        if array.count > 0 {
            return array[array.count - 1]
        }
        return -1
    }
}
func removeLastItemSync() {
    let workItem = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
        array.removeLast()
    }
    queue3.async(execute: workItem)
}
queue1.async {
    for _ in 0..<10000 {
        removeLastItemSync()
    }
}
queue2.async {
    for _ in 0..<10000 {
        print(getLastItemSync())
    }
}
