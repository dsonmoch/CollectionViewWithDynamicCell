//
//  CollectionHeaderReusableView.swift
//  StreamingMethodUi
//
//  Created by Admin on 16/11/22.
//

import UIKit

class CollectionHeaderReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    static let identifier = "CollectionHeaderReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionHeaderReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configure(text: String){
        headerLabel.text = text
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0.0, 0.0, self.frame.size.width, 1.0);
        topBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        self.layer.addSublayer(topBorder)
    }
}
