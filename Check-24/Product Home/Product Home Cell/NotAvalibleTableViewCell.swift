//
//  NotAvalibleTableViewCell.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit
import Cosmos


class NotAvalibleTableViewCell: UITableViewCell {

    //MARK:- OUTLETS
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
