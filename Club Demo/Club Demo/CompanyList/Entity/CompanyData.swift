//
//  CompanyData.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol CompanyDataProtocol: FollowConfigurable {
    var compId: String { get }
    var name: String? { get }
    var website: String? { get }
    var logo: String? { get }
    var about: String? { get }
    var members: [Employee]? { get }
}

protocol EmployeeDataProtocol: FavConfigurable {
    var empId: String { get }
    var age: Int? { get }
    var name: Name? { get }
    var email: String? { get }
    var phone: String? { get }
}

class CompanyData: Decodable, CompanyDataProtocol  {
    var compId: String
    var name: String?
    var website: String?
    var logo: String?
    var about: String?
    var members: [Employee]?
    var isFollowed: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case compId = "_id"
        case name = "company"
        case website
        case logo
        case about
        case members
    }
    
    required init(storable: StorableCompanyModel) {
        self.compId = storable.id
        self.isFollowed = storable.isFollowed
    }
}

class Employee: Decodable, EmployeeDataProtocol {
    var empId: String
    var age: Int?
    var name: Name?
    var email: String?
    var phone: String?
    
    var isFav: Bool = false
    var isFollowed: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case empId = "_id"
        case age
        case name
        case email
        case phone
    }
    
    required init(storable: StorableEmployeeModel) {
        self.empId = storable.id
        self.isFollowed = storable.isFollowed
        self.isFav = storable.isFavourite
    }
}

class Name: Decodable {
    var first: String?
    var last: String?
}

extension CompanyData: MappableProtocol {
    
    func mapToPersistenceObject() -> StorableCompanyModel {
        let response = StorableCompanyModel(compId: self.compId, isFollowed: self.isFollowed)
        return response
    }
    
    static func mapFromPersistenceObject(_ object: StorableCompanyModel) -> Self {
        return self.init(storable: object)
    }
}

extension Employee: MappableProtocol {
    
    func mapToPersistenceObject() -> StorableEmployeeModel {
        let response = StorableEmployeeModel(id: self.empId, isFollowed: self.isFollowed, isFav: self.isFav)
        return response
    }
    
    static func mapFromPersistenceObject(_ object: StorableEmployeeModel) -> Self {
        return self.init(storable: object)
    }
}
