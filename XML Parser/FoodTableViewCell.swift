

//
//  FoodTableViewCell.swift
//  XML Parser
//
//  Created by Asif Ikbal on 4/23/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!

    @IBOutlet weak var caloris: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
