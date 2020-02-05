//
//  DataManager.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import RealmSwift

struct Sorted {
    var key: String
    var ascending: Bool = true
}

//MARK: - Storable Protocol
protocol Storable {
    
}

extension Object: Storable {
    
}

//MARK: - DataManager Protocol
protocol DataManager {
    func save(object: Storable) throws
    func update(object: Storable, completion: @escaping () -> ()) throws
    func delete(object: Storable) throws
    func fetch<T: Storable>(_ model: T.Type, primaryKey: String) -> T?
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?, completion: ([T]) -> ())
}

//MARK: - MappableProtocol
protocol MappableProtocol {
    associatedtype PersistenceType: Storable
    
    //MARK: - Method
    func mapToPersistenceObject() -> PersistenceType
    static func mapFromPersistenceObject(_ object: PersistenceType) -> Self
}
