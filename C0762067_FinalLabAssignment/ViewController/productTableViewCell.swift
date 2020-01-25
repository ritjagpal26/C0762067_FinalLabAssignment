//
//  productTableViewCell.swift
//  C0762067_FinalLabAssignment
//
//  Created by Mac on 2020-01-24.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class productTableViewCell: UITableViewCell {
    @IBOutlet weak var namelable: UILabel!
    
    @IBOutlet weak var idlable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
