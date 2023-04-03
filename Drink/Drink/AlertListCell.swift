//
//  AlertListCell.swift
//  Drink
//
//  Created by juhoon lee on 2023/04/02.
//

import UIKit

class AlertListCell: UITableViewCell {
    @IBOutlet weak var alertSwitch: UISwitch!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
    }
}
