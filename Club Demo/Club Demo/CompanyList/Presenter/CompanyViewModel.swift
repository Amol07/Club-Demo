//
//  CompanyViewModel.swift
//  Club Demo
//
//  Created by Amol Prakash on 04/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol MembersModelProtocol {
    var membersVm: [EmployeeViewModel]? { get }
}

class CompanyViewModel: CompanyDataProtocol, MembersModelProtocol  {
    
    typealias T = CompanyData
    
    private var componyData: T?
    
    required init(model: T) {
        self.componyData = model
    }
    
    var compId: String? {
        return self.componyData?.compId
    }
    var name: String? {
        return self.componyData?.name
    }
    var website: String? {
        return self.componyData?.website
    }
    var logo: String? {
        return self.componyData?.logo
    }
    var about: String? {
        return self.componyData?.about
    }
    var members: [Employee]? {
        return self.componyData?.members
    }
    
    var membersVm: [EmployeeViewModel]? {
        var ds = [EmployeeViewModel]()
        self.componyData?.members?.forEach { model in
            ds.append(EmployeeViewModel(model: model))
        }
        return ds
    }
}

