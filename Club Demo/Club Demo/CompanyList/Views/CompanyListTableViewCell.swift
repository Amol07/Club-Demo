//
//  CompanyListTableViewCell.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import UIKit

class CompanyListTableViewCell: UITableViewCell, Reusable {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var companyImage: UIImageView! {
        didSet {
            self.companyImage.layer.cornerRadius = 5.0
        }
    }
    
    func configure(compnay: CompanyData) {
        self.nameLabel.text = compnay.name
        self.websiteLabel.text = compnay.website
        self.descriptionLabel.text = compnay.about
    }
}
