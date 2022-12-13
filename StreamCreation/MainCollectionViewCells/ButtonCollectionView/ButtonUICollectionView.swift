//
//  ButtonUICollectionView.swift
//  StreamCreation
//
//  Created by Admin on 30/11/22.
//

import UIKit

class ButtonUICollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCollectionView(){
        self.register(CollectionViewXibCell.nib(), forCellWithReuseIdentifier: CollectionViewXibCell.cellIdentifier)
        dataSource = self
        delegate = self
    }
    
}

extension ButtonUICollectionView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonCellViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewXibCell.cellIdentifier, for: indexPath) as! CollectionViewXibCell
        let cellItems = buttonCellViewData[indexPath.item]
        cell.configure(image: cellItems.image, title: cellItems.titleLabel, subTitle: cellItems.subtitleLabel)
        return cell
    }
    
}

extension ButtonUICollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewXibCell{
            cell.updateSelectedCell(isSelected: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewXibCell{
            cell.updateSelectedCell(isSelected: false)
        }
    }
}
