//
//  StorableModels.swift
//  Club Demo
//
//  Created by Amol Prakash on 04/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import RealmSwift

class StorableCompanyModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var isFollowed: Bool = false
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(compId: String, isFollowed: Bool) {
        self.init()
        self.id = compId
        self.isFollowed = isFollowed
    }
}

class StorableEmployeeModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var isFollowed: Bool = false
    @objc dynamic var isFavourite: Bool = false
    
    convenience init(id: String, isFollowed: Bool, isFav: Bool) {
        self.init()
        self.id = id
        self.isFollowed = isFollowed
        self.isFavourite = isFav
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
