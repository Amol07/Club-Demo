//
//  EmployeeListPresenter.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

class EmployeeListPresenter: EmployeeListPresenterProtocol {
    
    weak var view: EmployeeListViewProtocol?
    
    private var tempDataSource: [EmployeeViewModel] = []
    private var dataSource: [EmployeeViewModel] = []
    
    init(_ dataSource: [EmployeeViewModel]) {
        self.dataSource = dataSource
        self.tempDataSource = dataSource
    }
    
    var sortSelection: Int? = 0 {
        didSet {
            switch self.sortSelection {
            case 0:
                self.dataSource.sort { model1, model2 -> Bool in
                    return model1.name?.first ?? "" < model2.name?.first ?? ""
                }
            case 1:
                self.dataSource.sort { model1, model2 -> Bool in
                    return model1.name?.first ?? "" > model2.name?.first ?? ""
                }
            case 2:
                self.dataSource.sort { model1, model2 -> Bool in
                    return model1.age ?? 0  < model2.age ?? 0
                }
            case 3:
                self.dataSource.sort { model1, model2 -> Bool in
                    return model1.age ?? 0  > model2.age ?? 0
                }
            default:
                break
            }
        }
    }
    
    func viewDidLoad() {
        self.sortSelection = 0
        self.view?.loadingFinished()
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return self.dataSource.count
    }
    
    func items(atIndex indexPath: IndexPath) -> EmployeeViewModel {
        return self.dataSource[indexPath.row]
    }
    
    func search(searchText: String) {
        if searchText.isEmpty {
            self.dataSource = self.tempDataSource
        } else {
            self.dataSource = self.tempDataSource.filter { vmodel -> Bool in
                return vmodel.name?.first?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
         self.view?.loadingFinished()
    }
}
