//数组实现 stack 和 queue
struct Stack<T> {
    private var elements = [T]()
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(0)
print(stack.count)
print(stack.pop() ?? "已经是栈顶")

struct Queue<T> {
    private var elements = [T]()
    var count: Int {
        return elements.count
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }
}
var queue = Queue<Int>()
queue.enqueue(11)
queue.enqueue(6)
queue.enqueue(0)
print(queue.count)
print(queue.dequeue() ?? "已经到队列尾")
print(queue.count)
