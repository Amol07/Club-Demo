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
    @IBOutlet private weak var favButton: UIButton!
    @IBOutlet private weak var followButton: UIButton!
    
    private var model: EmployeeViewModel?
    var onUpdate: ((EmployeeViewModel) -> ())?
    
    func configure(withModel model: EmployeeViewModel) {
        self.model = model
        self.nameLabel.text = "Name: \([model.name?.first, model.name?.last].compactMap { $0 }.joined(separator: " "))"
        self.ageLabel.text = "Age: \(model.age ?? 0)"
        self.emailLabel.text = "Email Id - \(model.email ?? "Not Available")"
        self.phoneLabel.text = "Contact No - \(model.phone ?? "Not Available")"
        self.favButton.setImage(model.isFav ?  #imageLiteral(resourceName: "fav") : #imageLiteral(resourceName: "unfav"), for: .normal)
        self.followButton.setTitle(model.isFollowed ? "Unfollow" : "Follow", for: .normal)
    }
    
    @IBAction private func markFavourite(_ sender: Any) {
        self.model?.isFav = !(self.model?.isFav ?? false)
        self.favButton.setImage(self.model?.isFav ?? false ?  #imageLiteral(resourceName: "fav") : #imageLiteral(resourceName: "unfav"), for: .normal)
        if let model = self.model {
            self.onUpdate?(model)
        }
    }
    
    @IBAction private func markFollow(_ sender: Any) {
        let title: String
        if self.model?.isFollowed ?? false {
            title = "Follow"
        } else {
            title = "Unfollow"
        }
        self.model?.isFollowed = !(self.model?.isFollowed ?? false)
        self.followButton.setTitle(title, for: .normal)
        if let model = self.model {
            self.onUpdate?(model)
        }
    }
}
