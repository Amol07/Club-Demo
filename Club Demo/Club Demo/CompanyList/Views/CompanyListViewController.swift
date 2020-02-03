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
//        self.tableView.estimatedRowHeight = 60
//        self.tableView.rowHeight = UITableView.automaticDimension
        self.title = "Club"
        self.presenter?.viewDidLoad()
    }
    
    func setupUI() {
    }
}

extension CompanyListViewController: CompanyListViewProtocol {
    
    func loadingFinished() {
        self.setupUI()
        self.tableView.reloadData()
        self.indicator.stopAnimating()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter else { return UITableViewCell() }
        return UITableViewCell()
    }
}

extension CompanyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = self.presenter else { return }
    }
}
