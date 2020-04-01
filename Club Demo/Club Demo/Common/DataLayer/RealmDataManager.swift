//
//  RealmDataManager.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.

import Foundation
import RealmSwift

//MARK: - DataManager Implementation
class RealmDataManager {
    
    //MARK: - Stored Properties
    private let realm: Realm?
    
    init(_ realm: Realm? = try! Realm()) {
        self.realm = realm
    }
}

extension RealmDataManager: DataManager {
    
    //MARK: - Methods
    
    func update(object: Storable, completion: @escaping () -> ()) throws {
        guard let realm = realm, let object = object as? Object else {
            throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel
        }
        try realm.write {
            realm.add(object, update: .modified)
            completion()
        }
    }
    
    func delete(object: Storable) throws {
        guard let realm = realm, let object = object as? Object else { throw RealmError.eitherRealmIsNilOrNotRealmSpecificModel }
        try realm.write {
            realm.delete(object)
        }
    }
    
    func fetch<T>(_ model: T.Type, primaryKey: String) -> T? where T : Storable {
        guard let realm = realm, let model = model as? Object.Type else { return nil }
        return realm.object(ofType: model, forPrimaryKey: primaryKey) as? T
    }
}

