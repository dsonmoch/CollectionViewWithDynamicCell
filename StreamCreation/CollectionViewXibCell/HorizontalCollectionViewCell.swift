//
//  CollectionViewCell.swift
//  StreamingMethodUi
//
//  Created by Admin on 18/11/22.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var isSelectedButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let cellIdentifier = "HorizontalCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(titleText: String, isTopCell: Bool){
        titleLabel.text = titleText
        if(isTopCell){
            let topBorder = CALayer()
            topBorder.frame = CGRectMake(0.0, 0.0, self.frame.size.width, 1.0);
            topBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
            self.layer.addSublayer(topBorder)
        }
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRectMake(0.0, self.frame.size.height-1, self.frame.size.width, 1.0);
        bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        self.layer.addSublayer(bottomBorder)
    }
    
    func changeButtonIcon(buttonImage: UIImage){
        isSelectedButton.setImage(buttonImage, for: .normal)
    }

}
