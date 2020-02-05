//
//  EmployeeViewModel.swift
//  Club Demo
//
//  Created by Amol Prakash on 04/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol FollowConfigurable {
    var isFollowed: Bool { get set }
}

protocol FavConfigurable: FollowConfigurable {
    var isFav: Bool { get set }
}

class EmployeeViewModel: EmployeeDataProtocol, FavConfigurable {
    
    private var employee: Employee
    var associatedCompId: String
    
    required init(model: Employee, compId: String) {
        self.employee = model
        self.associatedCompId = compId
    }
    var isFav: Bool {
        set {
            self.employee.isFav = newValue
        }
        get {
            self.employee.isFav
        }
    }
    
    var isFollowed: Bool {
        set {
            self.employee.isFollowed = newValue
        }
        get {
            self.employee.isFollowed
        }
    }
    
    var empId: String {
        self.employee.empId
    }
    
    var age: Int? {
        self.employee.age
    }
    
    var name: Name? {
        self.employee.name
    }
    
    var email: String? {
        self.employee.email
    }
    
    var phone: String? {
        self.employee.phone
    }
}

