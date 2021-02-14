//
//  CustomCell.swift
//  Swift6FireStore1
//
//  Created by Tatsushi Fukunaga on 2021/02/11.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
