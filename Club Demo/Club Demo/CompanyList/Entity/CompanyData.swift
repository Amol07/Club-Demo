//
//  CompanyData.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class CompanyData: Decodable  {
    var compId: String?
    var name: String?
    var website: String?
    var logo: String?
    var about: String?
    var members: [Employee]?
    
    private enum CodingKeys: String, CodingKey {
        case compId = "_id"
        case name = "company"
        case website
        case logo
        case about
        case members
    }
}

class Employee: Decodable {
    var empId: String?
    var age: Int?
    var name: Name?
    var email: String?
    var phone: String?
    
    private enum CodingKeys: String, CodingKey {
        case empId = "_id"
        case age
        case name
        case email
        case phone
    }
}

class Name: Decodable {
    var first: String?
    var last: String?
}
