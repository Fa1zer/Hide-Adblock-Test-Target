//
//  LinkedList.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation

final public class Node<T> {
    
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var next: Node?
    var last: Node?
    let id = UUID()
    
}

extension Node: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.id == rhs.id
    }
}
