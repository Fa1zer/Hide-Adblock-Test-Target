//
//  LinkedList.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation

final public class LinkedList<T> {
    
    subscript(index: Int) -> Node<T> {
        self.nodes[index]
    }
    
    public var first: Node<T>? { self.nodes.first }
    public var last: Node<T>? { self.nodes.last }
    public var count: Int { self.nodes.count }
    private var nodes = [Node<T>]()
    
    init(elements: [T] = [T]()) {
        for element in elements {
            self.append(element)
        }
    }
    
    public func append(_ value: T) {
        let node = Node(value: value)
                
        node.last = self.nodes.last
        
        self.nodes.last?.next = node
        
        self.nodes.append(node)
    }
    
    public func remove(at index: Int) {
        if let next = self.nodes[index].next, self.nodes[index] != self.nodes.first {
            self.nodes[index - 1].next = next
        }
        
        if let last = self.nodes[index].last, self.nodes[index] != self.nodes.last {
            self.nodes[index + 1].last = last
        }
        
        self.nodes.remove(at: index)
    }
    
}
