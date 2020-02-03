//
//  CompanyListFetcher.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class CompanyListFetcher: CompanyListFetcherInputProtocol {
    weak var interactor: CompanyListFetcherOutputProtocol?
    func getCompanyData() {
        ApiClient<[CompanyData]>.makeRequest(toURL: Endpoints.Company.fetch.url) { [weak self] response, error in
            guard let response = response else {
                self?.interactor?.failedWith(error: error)
                return
            }
            self?.interactor?.didFetchCompanyData(response: response)
        }
    }
}
