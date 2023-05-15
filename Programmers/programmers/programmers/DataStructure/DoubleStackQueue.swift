//
//  DoubleStackQueue.swift
//  programmers
//
//  Created by sejin on 2023/05/08.
//

import Foundation

struct DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var origin: [T] {
        return outbox.reversed() + inbox
    }
    
    init() {}
    
    init(array: [T]) {
        self.inbox = array
    }

    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}
