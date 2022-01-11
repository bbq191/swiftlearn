//GCD
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
queue.sync {
    sleep(1)
    print("in queue sync")//同步
}
print("after invoke queue method ==== sync")
queue.async {
    sleep(1)
    print("in queue async")//异步
}
print("after invoke queue method ==== async")
//asyncafter
queue.asyncAfter(deadline: .now()+1) {
    print("in 1 second asyncafter")
}
print("after invoke queue method ==== asyncafter")
//DispatchGroup 特性
//wait 版
//解析：先打印的 group enter 调用完成，后进入并行线程，调接口 A 或者 接口 B，但是 AB 的顺序不确定，有可能 A 先，也有可能 B 先。AB 都 leave 以后才会调用 wait，wait 会把后续任务阻塞住。最后输出合并数据
let workGroup = DispatchGroup()
//enter leave 需要成对出现
workGroup.enter()
queue.async {
    sleep(1)
    print("接口请求 A 完成")
    workGroup.leave()
}
workGroup.enter()
queue.async {
    sleep(1)
    print("接口请求 B 完成")
    workGroup.leave()
}
print(" group enter 调用完成")
workGroup.wait()
print("AB 接口皆调用完成，开始合并数据")
print("验证阻塞")
//notify 版 - 运行 notify 版先屏蔽 40-42 行
//解析：前面 enter 和 leave 与 wait 都一样，不同的地方在于 notify 是不阻塞的，它会先打印“验证不阻塞”，然后等 AB 接口的两个 leave 都完成以后打印合并数据，不会像 wait 那样阻塞住，等 wait 完成才打印最后两句
workGroup.notify(queue: queue) {
    print("AB 接口皆调用完成，开始合并数据 -notify")
}
print("验证不阻塞")

//DispatchSource 推荐计时器、文件监听（增加，修改，删除）、app 间进程通信时使用，请查阅相关 API
var seconds = 10
let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
timer.schedule(deadline: .now(), repeating: 1.0)
timer.setEventHandler {
    seconds -= 1
    if seconds < 0 {
        timer.cancel()
    } else {
        print(seconds)
    }
}
timer.resume()
