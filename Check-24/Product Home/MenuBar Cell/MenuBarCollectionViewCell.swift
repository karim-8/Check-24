//
//  MenuBarCollectionViewCell.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {

    //MARK:- OUTLETS
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var filterName: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        filterName.backgroundColor = .clear
        filterName.alpha = 0.6
    }

    //MARK:- SETUP CELL
    func setupCell(text: String) {
        filterName.text = text
    }
    
    //MARK:- IS SELECTED
    override var isSelected: Bool {
        didSet{
            filterName.alpha = isSelected ? 1.0 : 0.6
        }
    }
}
