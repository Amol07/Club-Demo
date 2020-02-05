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
    var sortSelection: Int? { get set }
    
    func viewDidLoad()
    func numberOfRowsIn(section: Int) -> Int
    func items(atIndex indexPath: IndexPath) -> CompanyViewModel
    func search(searchText: String)
    func selected(index: IndexPath)
    func followed(obj: CompanyViewModel)
}

// Presenter to Interactor
protocol CompanyListInteractorInputProtocol: AnyObject {
    var presenter: CompanyListInteractorOutputProtocol? { get set }
    var fetcher: CompanyListFetcherInputProtocol? { get set }
    
    func getCompanyData()
    func followed(obj: CompanyViewModel)
    func update(obj: EmployeeViewModel)
}

// Interactor to Presenter
protocol CompanyListInteractorOutputProtocol: AnyObject {
    func didFetch(response: [CompanyViewModel])
    func failedWith(error: CustomError?)
}

// Interactor to Fetcher
protocol CompanyListFetcherInputProtocol: AnyObject {
    var interactor: CompanyListFetcherOutputProtocol? { get set }
    func getCompanyData()
}

// Fetcher to Interactor
protocol CompanyListFetcherOutputProtocol: AnyObject {
    func didFetch(response: [CompanyData])
    func failedWith(error: CustomError?)
}

// Presenter to Router
protocol CompanyListRouterProtocol {
    static func createCompanyListModule() -> UIViewController
    static func createEmployeeListModule(dataSource: [EmployeeViewModel], companyPresenter: CompanyListPresenter?) -> UIViewController
    func showMemberScreen(from view: CompanyListViewProtocol?, presenter: CompanyListPresenter, dataSource: [EmployeeViewModel])
}
