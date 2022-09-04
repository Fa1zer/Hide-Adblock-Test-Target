//
//  ParseManager.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import ParseSwift
import Combine

final class ParseManager {
    
    static func all<T: ParseObject>() -> AnyPublisher<[T], Never> {
        T.query.findPublisher()
            .replaceError(with: [T]())
            .eraseToAnyPublisher()
    }
    
    static func last<T: ParseObject>() -> AnyPublisher<T, Never> {
        T.query.findAllPublisher()
            .map { models in
                return models.last ?? T()
            }
            .replaceError(with: T())
            .eraseToAnyPublisher()
    }
    
    static func first<T: ParseObject>() -> AnyPublisher<T, Never> {
        T.query.findAllPublisher()
            .map { models in
                return models.first ?? T()
            }
            .replaceError(with: T())
            .eraseToAnyPublisher()
    }
    
}
