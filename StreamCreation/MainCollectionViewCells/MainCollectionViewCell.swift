//
//  MainCollectionViewCell.swift
//  StreamCreation
//
//  Created by Admin on 28/11/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var cellContentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var listViewTopConstraints: NSLayoutConstraint!
    
    static let cellIdentifier = "MainCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContentView.layer.cornerRadius = 9
        cellContentView.clipsToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MainCollectionViewCell", bundle: nil)
    }
    
    public func configureDefaults(image: UIImage, text: String, collectionView: UICollectionView){
        imageView.image = image
        label.text = text
        listView.addSubview(collectionView)
    }
    
    public func expandCell(isExpanded: Bool){
        listView.isHidden = !isExpanded
        if(isExpanded){
            listViewTopConstraints.constant = 50
            cellContentViewHeight.constant = 320
        }else{
            cellContentViewHeight.constant = 60
        }
    }
}
