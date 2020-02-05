//
//  CompanyViewModel.swift
//  Club Demo
//
//  Created by Amol Prakash on 04/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol MembersModelProtocol {
    var membersVm: [EmployeeViewModel] { get }
}

class CompanyViewModel: CompanyDataProtocol, MembersModelProtocol, FollowConfigurable  {
    
    private var componyData: CompanyData
    var membersVm: [EmployeeViewModel]
    
    required init(model: CompanyData) {
        self.componyData = model
        self.membersVm = [EmployeeViewModel]()
        model.members?.forEach { employee in
            self.membersVm.append(EmployeeViewModel(model: employee, compId: model.compId))
        }
    }
    
    var isFollowed: Bool {
        set {
            self.componyData.isFollowed = newValue
        }
        get {
            self.componyData.isFollowed
        }
    }
    
    var compId: String {
        return self.componyData.compId
    }
    var name: String? {
        return self.componyData.name
    }
    var website: String? {
        return self.componyData.website
    }
    var logo: String? {
        return self.componyData.logo
    }
    var about: String? {
        return self.componyData.about
    }
    
    var members: [Employee]? {
        return self.componyData.members
    }
}

