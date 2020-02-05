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
    
    private var tempDataSource: [CompanyViewModel] = []
    private var dataSource: [CompanyViewModel] = []
    
    var sortSelection: Int? = 0 {
        didSet {
            switch self.sortSelection {
            case 0:
                self.dataSource.sort { model1, model2 -> Bool in
                    return model1.name ?? "" < model2.name ?? ""
                }
            case 1:
            self.dataSource.sort { model1, model2 -> Bool in
                return model1.name ?? "" > model2.name ?? ""
            }
            default:
                break
            }
        }
    }
    
    func viewDidLoad() {
        self.interactor?.getCompanyData()
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return self.dataSource.count
    }
    
    func items(atIndex indexPath: IndexPath) -> CompanyViewModel {
        return self.dataSource[indexPath.row]
    }
    
    func search(searchText: String) {
        if searchText.isEmpty {
            self.dataSource = self.tempDataSource
            let sortSelection = self.sortSelection
            self.sortSelection = sortSelection
        } else {
            self.dataSource = self.tempDataSource.filter { vmodel -> Bool in
                return vmodel.name?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
         self.view?.loadingFinished()
    }
    
    func selected(index: IndexPath) {
        let item = self.items(atIndex: index)
        self.router?.showMemberScreen(from: self.view, presenter: self, dataSource: item.membersVm )
    }
    
    func followed(obj: CompanyViewModel) {
        self.interactor?.followed(obj: obj)
    }
}

extension CompanyListPresenter: UpdateEmployeeDelegate {
    
    func update(emp: EmployeeViewModel) {
        self.interactor?.update(obj: emp)
    }
}

extension CompanyListPresenter: CompanyListInteractorOutputProtocol {
    
    func didFetch(response: [CompanyViewModel]) {
        self.dataSource = response
        self.sortSelection = 0
        self.tempDataSource = self.dataSource
        self.view?.loadingFinished()
    }
    
    func failedWith(error: CustomError?) {
        self.view?.failed(withError: error)
    }
}
