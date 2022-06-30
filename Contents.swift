import UIKit

struct Heap<T> {
    var elements = [T]()
    
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    var isOrdered: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.isOrdered = sort
    }
    
    func parentOf(_ index: Int) -> Int {
            return (index - 1) / 2
        }
        func leftOf(_ index: Int) -> Int {
            return (2 * index) + 1
        }
        func rightOf(_ index: Int) -> Int {
            return (2 * index) + 2
        }
    mutating func heapifyDown(index: Int, heapSize: Int) {

            var parentIndex = index
            
            while true {
                let leftIndex = self.leftOf(parentIndex)
                let rightIndex = leftIndex + 1
                
                var first = parentIndex
                if leftIndex < heapSize && isOrdered(elements[leftIndex], elements[first]) {
                    first = leftIndex
                }
                if rightIndex < heapSize && isOrdered(elements[rightIndex], elements[first]) {
                    first = rightIndex
                }
                if first == parentIndex { return }
                
                elements.swapAt(parentIndex, first)
                parentIndex = first
            }
        }

    mutating func shiftDown() {
            heapifyDown(index: 0, heapSize: elements.count)
        }

}

