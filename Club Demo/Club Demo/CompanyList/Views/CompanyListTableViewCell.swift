//
//  CompanyListTableViewCell.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import UIKit

class CompanyListTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var companyImage: UIImageView! {
        didSet {
            self.companyImage.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet private weak var followButton: UIButton!
    
    private var model: CompanyViewModel?
    var onFollow: ((CompanyViewModel) -> ())?
    
    func configure(withModel model: CompanyViewModel) {
        self.model = model
        self.nameLabel.text = model.name
        self.websiteLabel.text = model.website
        self.descriptionLabel.text = model.about
        self.companyImage.setImage(with: model.logo, placeHolder: UIImageView.placeHolderImage, completed: nil)
        self.followButton.setTitle(model.isFollowed ? "Unfollow" : "Follow", for: .normal)
    }
    
    @IBAction private func markFollow(_ sender: Any) {
        let title: String
        self.model?.isFollowed = !(self.model?.isFollowed ?? false)
        if self.model?.isFollowed ?? false {
            title = "Unfollow"
        } else {
            title = "Follow"
        }
        self.followButton.setTitle(title, for: .normal)
        if let obj = self.model {
            self.onFollow?(obj)
        }
    }
}
