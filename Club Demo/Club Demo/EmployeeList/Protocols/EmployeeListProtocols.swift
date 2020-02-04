//
//  EmployeeListProtocols.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import UIKit

// Presenter to View
protocol EmployeeListViewProtocol: AnyObject {
    var presenter: EmployeeListPresenterProtocol? { get set }
    
    func loadingFinished()
    func failed(withError error: CustomError?)
}

// View to Presenter
protocol EmployeeListPresenterProtocol: AnyObject {
    var view: EmployeeListViewProtocol? { get set }
    
    var sortSelection: Int? { get set }
    func viewDidLoad()
    func numberOfRowsIn(section: Int) -> Int
    func items(atIndex indexPath: IndexPath) -> EmployeeViewModel
    func search(searchText: String)
}
