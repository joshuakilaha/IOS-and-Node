//
//  TableViewCell.swift
//  IOS and Node
//
//  Created by Kilz on 17/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var itemNameLable: UILabel!
    @IBOutlet weak var itemDescriptionLable: UITextView!
    @IBOutlet weak var itemPriceLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell() {
        print("posts")
    }

}
