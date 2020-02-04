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
    typealias T = Employee
    
    private var employee: Employee
    
    required init(model: Employee) {
        self.employee = model
    }
    var isFav: Bool = false
    
    var isFollowed: Bool = false
    
    var empId: String? {
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

