//
//  TableCellTableViewCell.swift
//  snapChatProject
//
//  Created by Aakash Bhalothia on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
