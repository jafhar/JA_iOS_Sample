//
//  JAThingsTableViewCell.swift
//  JA_iOS_Task
//
//  Created by Jafhar Sharief B on 16/11/17.
//  Copyright © 2017 Jafhar. All rights reserved.
//

import UIKit

class JAThingsTableViewCell: UITableViewCell {
    @IBOutlet weak var thingsImageView: UIImageView!

    @IBOutlet weak var thingsTitle: UILabel!
    
    @IBOutlet weak var thingsSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
