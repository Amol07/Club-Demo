//
//  CompanyListProtocols.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import UIKit

// Presenter to View
protocol CompanyListViewProtocol: AnyObject {
    var presenter: CompanyListPresenterProtocol? { get set }
    
    func loadingFinished()
    func failed(withError error: CustomError?)
}

// View to Presenter
protocol CompanyListPresenterProtocol: AnyObject {
    var view: CompanyListViewProtocol? { get set }
    var interactor: CompanyListInteractorInputProtocol? { get set }
    var router: CompanyListRouterProtocol? { get set }
    
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfItemsIn(section: Int) -> Int
    func compnayMemberAt(indexPath: IndexPath) -> Employee
    func company(atSection section: Int) -> CompanyData
}

// Presenter to Interactor
protocol CompanyListInteractorInputProtocol: AnyObject {
    var presenter: CompanyListInteractorOutputProtocol? { get set }
    var fetcher: CompanyListFetcherInputProtocol? { get set }
    
    func getCompanyData()
}

// Interactor to Presenter
protocol CompanyListInteractorOutputProtocol: AnyObject {
    func didFetch(response: [CompanyData])
    func failedWith(error: CustomError?)
}

// Interactor to Fetcher
protocol CompanyListFetcherInputProtocol: AnyObject {
    var interactor: CompanyListFetcherOutputProtocol? { get set }
    func getCompanyData()
}

// Fetcher to Interactor
protocol CompanyListFetcherOutputProtocol: AnyObject {
    func didFetchCompanyData(response: [CompanyData])
    func failedWith(error: CustomError?)
}

// Presenter to Router
protocol CompanyListRouterProtocol {
    static func createCompanyListModule() -> UIViewController
}
