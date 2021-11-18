//
//  ProdHomeTableViewCell.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit
import Cosmos

class ProdHomeTableViewCell: UITableViewCell {

    //MARK:- PROPERTIES
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var ProductTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productprice: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        print("66666 \(productprice)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
