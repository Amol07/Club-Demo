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
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var segment: UISegmentedControl!
    
    var presenter: CompanyListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 112
        self.tableView.rowHeight = UITableView.automaticDimension
        self.title = "Companies"
        self.presenter?.viewDidLoad()
    }
    
    @IBAction private func sort(_ sender: UISegmentedControl) {
        guard let presenter = self.presenter else { return }
        presenter.sortSelection = sender.selectedSegmentIndex
        self.loadingFinished()
    }
}

extension CompanyListViewController: CompanyListViewProtocol {
    
    func loadingFinished() {
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
        return presenter.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CompanyListTableViewCell.self)
        let model = presenter.items(atIndex: indexPath)
        cell.configure(withModel: model)
        cell.onFollow = { [weak self] obj in
            self?.presenter?.followed(obj: obj)
        }
        return cell
    }
}

extension CompanyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let presenter = self.presenter else { return }
        presenter.selected(index: indexPath)
    }
}

extension CompanyListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        self.presenter?.search(searchText: text)        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
