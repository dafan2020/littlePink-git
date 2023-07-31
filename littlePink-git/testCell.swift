//
//  testCell.swift
//  littlePink-git
//
//  Created by 彭祎清 on 2023/7/31.
//

import UIKit

class testCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var butotn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
