//
//  BaseRepository.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.

import Foundation

//MARK: - BaseRepository
class BaseRepository<T> {
    
    //MARK: - Stored Properties
    private var dbManager : DataManager
    
    //MARK: - Init
    required init(dbManager : DataManager) {
        self.dbManager = dbManager
    }
    
    //MARK: - Methods
    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?, completion: ([T]) -> ()) where T : Storable {
        self.dbManager.fetch(model, predicate: predicate, sorted: sorted, completion: completion)
    }
    
    func fetch<T>(_ model: T.Type, primaryKey: String) -> T? where T: Storable {
        self.dbManager.fetch(model, primaryKey: primaryKey)
    }
    
    func update(object: Storable, completion: @escaping () -> ()) throws {
        try self.dbManager.update(object: object, completion: completion)
    }
    
    func delete(object: Storable) throws {
        try dbManager.delete(object: object)
    }
    
    func save(object: Storable) throws {
        try self.dbManager.save(object: object)
    }
}
