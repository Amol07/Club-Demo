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
    
    func viewDidLoad() {
        self.interactor?.getCompanyData()
    }
    
    func numberOfItemsIn(section: Int) -> Int {
        return 0
    }
}

extension CompanyListPresenter: CompanyListInteractorOutputProtocol {
    
    func didFetch(response: [CompanyData]) {
        
    }
    
    func failedWith(error: CustomError?) {
        
    }
}
