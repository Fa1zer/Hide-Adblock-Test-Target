//
//  ParseManager.swift
//  Hide Adblock Test Target
//
//  Created by Artemiy Zuzin on 04.09.2022.
//

import Foundation
import ParseSwift

final class ParseManager {
    
    static func all<T: ParseObject>(completionHandler: @escaping ([T]) -> Void) {
        T.query.findAll { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    completionHandler(models)
                }
                
                return
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                    completionHandler([T]())
                }
                
                return
            }
        }
    }
    
    static func last<T: ParseObject>(completionHandler: @escaping (T) -> Void) {
        T.query.findAll { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    completionHandler(models.last ?? T())
                }
                
                return
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                    completionHandler(T())
                }
                
                return
            }
        }
    }
    
    static func first<T: ParseObject>(completionHandler: @escaping (T) -> Void) {
        T.query.findAll { result in
            switch result {
            case .success(let models):
                DispatchQueue.main.async {
                    completionHandler(models.first ?? T())
                }
                
                return
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                    completionHandler(T())
                }
                
                return
            }
        }
    }
    
}
