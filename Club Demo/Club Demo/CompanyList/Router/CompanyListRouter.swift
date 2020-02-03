//
//  CompanyListRouter.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import UIKit

var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: Bundle.main)
}

class CompanyListRouter: CompanyListRouterProtocol {
    
    static func createCompanyListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "CompanyListNavigationViewController")
        if let view = navController.children.first as? CompanyListViewController {
            let presenter: CompanyListPresenterProtocol & CompanyListInteractorOutputProtocol = CompanyListPresenter()
            let interactor: CompanyListInteractorInputProtocol & CompanyListFetcherOutputProtocol = CompanyListInteractor()
            let remoteDataFetcher: CompanyListFetcherInputProtocol = CompanyListFetcher()
            let router: CompanyListRouterProtocol = CompanyListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.fetcher = remoteDataFetcher
            remoteDataFetcher.interactor = interactor
            return navController
        }
        return UIViewController()
    }
}
