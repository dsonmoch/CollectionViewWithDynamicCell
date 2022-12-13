//
//  CollectionViewXibCell.swift
//  StreamingMethodUi
//
//  Created by Admin on 16/11/22.
//

import UIKit

class CollectionViewXibCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var tickMark: UIButton!
    
    static let cellIdentifier = "CollectionViewXibCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewXibCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage, title: String, subTitle: String){
        imageView.image = image
        titleLabel.text = title
        subTitleLabel.text = subTitle
        cellView.layer.cornerRadius = 15
        cellView.layer.borderColor = UIColor.lightGray.cgColor
        cellView.layer.borderWidth = 1
    }
    
    func updateSelectedCell(isSelected: Bool){
        if(isSelected){
            self.cellView.backgroundColor = UIColor.systemGreen
            self.tickMark.isHidden = false
        }else{
            self.cellView.backgroundColor = UIColor.white
            self.tickMark.isHidden = true
        }
    }
}

