//
//  CompanyListPresenter.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class CompanyListPresenter: CompanyListPresenterProtocol {
    
    weak var view: CompanyListViewProtocol?
    var interactor: CompanyListInteractorInputProtocol?
    var router: CompanyListRouterProtocol?
    
    private var dataSource: [CompanyData] = []
    
    func viewDidLoad() {
        self.interactor?.getCompanyData()
    }
    
    func numberOfSections() -> Int {
        return self.dataSource.count
    }
    
    func numberOfItemsIn(section: Int) -> Int {
        return self.dataSource[section].members?.count ?? 0
    }
    
    func compnayMemberAt(indexPath: IndexPath) -> Employee {
        return self.dataSource[indexPath.section].members![indexPath.row]
    }
    
    func company(atSection section: Int) -> CompanyData {
        return self.dataSource[section]
    }
}

extension CompanyListPresenter: CompanyListInteractorOutputProtocol {
    
    func didFetch(response: [CompanyData]) {
        self.dataSource = response
        self.view?.loadingFinished()
    }
    
    func failedWith(error: CustomError?) {
        
    }
}
