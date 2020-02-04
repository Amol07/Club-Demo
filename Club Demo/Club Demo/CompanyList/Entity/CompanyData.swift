//
//  CompanyData.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol PresenterConfigurable {
    associatedtype T
}

protocol CompanyDataProtocol {
    associatedtype T
    var compId: String? { get }
    var name: String? { get }
    var website: String? { get }
    var logo: String? { get }
    var about: String? { get }
    var members: [Employee]? { get }
    init(model: CompanyData)
}

protocol EmployeeDataProtocol {
    var empId: String? { get }
    var age: Int? { get }
    var name: Name? { get }
    var email: String? { get }
    var phone: String? { get }
    init(model: Employee)
}

class CompanyData: CompanyDataProtocol, Decodable  {
    required init(model: CompanyData) {
        
    }
    
    typealias T = Employee
    var compId: String?
    var name: String?
    var website: String?
    var logo: String?
    var about: String?
    var members: [T]?
    
    private enum CodingKeys: String, CodingKey {
        case compId = "_id"
        case name = "company"
        case website
        case logo
        case about
        case members
    }
}

class Employee: Decodable, EmployeeDataProtocol {
    required init(model: Employee) {
        
    }
    
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
