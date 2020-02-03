//
//  EmployeeListTableViewCell.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell, Reusable {
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    
    func configure(employee: Employee) {
        self.nameLabel.text = "Name: \([employee.name?.first, employee.name?.last].compactMap { $0 }.joined(separator: " "))"
        self.ageLabel.text = "Age: \(employee.age ?? 0)"
        self.emailLabel.text = "Email Id - \(employee.email ?? "Not Available")"
         self.phoneLabel.text = "Contact No - \(employee.phone ?? "Not Available")"
    }
}
