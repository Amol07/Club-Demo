//
//  CompanyListInteractor.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class CompanyListInteractor: CompanyListInteractorInputProtocol {
    
    weak var presenter: CompanyListInteractorOutputProtocol?
    var fetcher: CompanyListFetcherInputProtocol?
    
    private var repository: ResponseRepository
    private var compData: [CompanyData] = []
    
    init(dbManager: RealmDataManager = RealmDataManager(RealmProvider.default)) {
        self.repository = ResponseRepository(dbManager: dbManager)
    }
    
    func getCompanyData() {
        self.fetcher?.getCompanyData()
    }
    
    func followed(obj: CompanyViewModel) {
        let companyObj = self.compData.filter { compObj -> Bool in
            compObj.compId == obj.compId
        }.first
        if let obj = companyObj {
            if obj.isFollowed {
                self.repository.updateResponse(obj)
            } else {
                if let obj = self.repository.fetch(StorableCompanyModel.self, primaryKey: obj.compId) {
                    self.repository.delete(obj)
                }
            }
        }
    }
    
    func update(obj: EmployeeViewModel) {
        self.compData.forEach { company in
            let employeeObj = company.members?.filter { employee -> Bool in
                employee.empId == obj.empId
            }.first
            if let empObj = employeeObj {
                if obj.isFollowed || obj.isFav {
                    empObj.isFav = obj.isFav
                    empObj.isFollowed  = obj.isFollowed
                    self.repository.updateResponse(empObj)
                } else {
                    if let obj = self.repository.fetch(StorableEmployeeModel.self, primaryKey: obj.empId) {
                        self.repository.delete(obj)
                    }
                }
                return
            }
        }
    }
}

extension CompanyListInteractor: CompanyListFetcherOutputProtocol {
    func didFetch(response: [CompanyData]) {
        self.compData = response
        // process all the response
        var compVM = [CompanyViewModel]()
        response.forEach { company in
            if let _ = self.repository.fetch(StorableCompanyModel.self, primaryKey: company.compId) {
                company.isFollowed = true
            }
            company.members?.forEach { employee in
                if let obj = self.repository.fetch(StorableEmployeeModel.self, primaryKey: employee.empId) {
                    employee.isFav = obj.isFavourite
                    employee.isFollowed = obj.isFollowed
                }
            }
            compVM.append(CompanyViewModel(model: company))
        }
        self.presenter?.didFetch(response: compVM)
    }
    
    func failedWith(error: CustomError?) {
        self.presenter?.failedWith(error: error)
    }
}
