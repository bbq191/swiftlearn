//多线程
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
//多线程的创建
for i in 0..<10 {
    Thread.detachNewThread {
        print(i)
    }
}

class ObjectThread {
    func threadTest() {
        let thread = Thread(target: self, selector: #selector(threadWork), object: nil)
        thread.start()
    }
    @objc func threadWork() {
        print("threadWorker")
    }
}
let obj = ObjectThread()
obj.threadTest()

//operation
class ObjectOperation {
    func test() {
        let operation = BlockOperation {[weak self] in self?.threadWork()
        }
        //operation 回调
        operation.completionBlock = {() -> Void in
            print("我是等待接收的回调")
        }
        let myOperation = MyOperation()
        let queue = OperationQueue()
        queue.addOperation(operation)
        queue.addOperation(myOperation)
    }
    @objc func threadWork() {
        sleep(2)
        print("threadWorker")
    }
}
//自定义 operation
class MyOperation: Operation {
    override func main() {
         sleep(5)
        print("my operation====")
    }
}
let obj1 = ObjectOperation()
obj1.test()
print("异步线程，我先打印哦")

