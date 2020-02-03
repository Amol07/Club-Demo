//
//  CompanyListViewController.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import UIKit

class CompanyListViewController: UIViewController {
    
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: CompanyListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 86
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 98
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.title = "Club"
        self.presenter?.viewDidLoad()
    }
}

extension CompanyListViewController: CompanyListViewProtocol {
    
    func loadingFinished() {
        self.tableView.reloadData()
//        self.indicator.stopAnimating()
    }
    
    func failed(withError error: CustomError?) {
        self.indicator.stopAnimating()
        self.showAlert(title: "Error", message: error?.errorDescription ?? "Something went wrong. Please try again later.") { (alert, index) in
        }
    }
}

extension CompanyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else { return 0 }
        return presenter.numberOfItemsIn(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter = self.presenter else { return 0 }
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: EmployeeListTableViewCell.self)
        let empData = presenter.compnayMemberAt(indexPath: indexPath)
        cell.configure(employee: empData)
        return cell
    }
}

extension CompanyListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyListTableViewCell.reuseIdentifier) as? CompanyListTableViewCell else { return nil }
        guard let presenter = self.presenter else { return nil }
        let compData = presenter.company(atSection: section)
        cell.configure(compnay: compData)
        return cell
    }
}
