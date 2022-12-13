//
//  ListCollectionUiView.swift
//  StreamCreation
//
//  Created by Admin on 29/11/22.
//

import UIKit

class ListCollectionUiView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCollectionView(){
        self.register(HorizontalCollectionViewCell.nib(), forCellWithReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier)
        self.register(CollectionHeaderReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderReusableView.identifier)
        dataSource = self
        delegate = self
    }
    
}

extension ListCollectionUiView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horizontalCellViewData[0].titleLabelText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.cellIdentifier, for: indexPath) as! HorizontalCollectionViewCell
        let cellItems = horizontalCellViewData[0]
        if (indexPath.row == 0){
            cell.configure(titleText: cellItems.titleLabelText[indexPath.item], isTopCell: true)
            
        }else{
            cell.configure(titleText: cellItems.titleLabelText[indexPath.item], isTopCell: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderReusableView.identifier, for: indexPath) as! CollectionHeaderReusableView
        let cellItems = horizontalCellViewData[0]
        headerView.configure(text: cellItems.headerTitle)
        return headerView
    }
    
}

extension ListCollectionUiView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HorizontalCollectionViewCell{
            cell.changeButtonIcon(buttonImage: UIImage(systemName: "circle.fill")!)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HorizontalCollectionViewCell{
            cell.changeButtonIcon(buttonImage: UIImage(systemName: "circle")!)
        }
    }
}
