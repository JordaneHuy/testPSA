//
//  LocationTableViewCell.swift
//  psatest
//
//  Created by Jordane HUY on 01/03/2023.
//

import UIKit
import OpenWeather

class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(location: Location) {
        self.locationLabel.text = location.name
    }
}
