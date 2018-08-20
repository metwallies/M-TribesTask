//
//  PlaceMarkTableViewCell.swift
//  M-Tribes task
//
//  Created by islam metwally on 8/20/18.
//  Copyright © 2018 Islam Metwally. All rights reserved.
//

import UIKit

class PlaceMarkTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(placeMark: PlaceMark) {
        self.nameLabel.text         = "Name: " + placeMark.name
        self.addressLabel.text      = "Address: " + placeMark.address
        self.engineTypeLabel.text   = "Engine type: " + placeMark.engingeType
        self.fuelLabel.text         = "Fuel: \(placeMark.fuel)%"
    }
}
