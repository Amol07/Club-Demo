//
//  EmployeeListViewController.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var segment: UISegmentedControl!
    
    var presenter: EmployeeListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 88
        self.tableView.rowHeight = UITableView.automaticDimension
        self.title = "Members"
        self.presenter?.viewDidLoad()
    }
    
    @IBAction private func sort(_ sender: UISegmentedControl) {
        guard let presenter = self.presenter else { return }
        presenter.sortSelection = sender.selectedSegmentIndex
        self.loadingFinished()
    }
}

extension EmployeeListViewController: EmployeeListViewProtocol {
    
    func loadingFinished() {
        self.tableView.reloadData()
    }
    
    func failed(withError error: CustomError?) {
        self.showAlert(title: "Error", message: error?.errorDescription ?? "Something went wrong. Please try again later.") { (alert, index) in
        }
    }
}

extension EmployeeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else { return 0 }
        return presenter.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: EmployeeListTableViewCell.self)
        let model = presenter.items(atIndex: indexPath)
        cell.configure(withModel: model)
        cell.onFavourite = { model in
            // save model on fav click
        }
        return cell
    }
}

extension EmployeeListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        self.presenter?.search(searchText: text)        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
