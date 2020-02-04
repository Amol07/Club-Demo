//
//  CompanyListInteractor.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class CompanyListInteractor<T: Decodable>: CompanyListInteractorInputProtocol {
    
    weak var presenter: CompanyListInteractorOutputProtocol?
    var fetcher: CompanyListFetcherInputProtocol?
    
    func getCompanyData() {
        self.fetcher?.getCompanyData()
    }
}

extension CompanyListInteractor: CompanyListFetcherOutputProtocol {
    func didFetch<T>(response: [T]) {
        self.presenter?.didFetch(response: response)
    }
    
    func failedWith(error: CustomError?) {
        self.presenter?.failedWith(error: error)
    }
}
