//
//  ViewController.swift
//  StreamCreation
//
//  Created by Admin on 28/11/22.
//

import UIKit

var isExpanded = Array(repeating: false, count: mainCollectionViewCellData.count)

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    let PADDING = CGFloat(8.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.register(MainCollectionViewCell.nib(), forCellWithReuseIdentifier: MainCollectionViewCell.cellIdentifier)
        mainCollectionView.collectionViewLayout = mainCollectionViewLayout()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
    
    func createListLayout() -> UICollectionViewCompositionalLayout {
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(1)
        let heightDimension = NSCollectionLayoutDimension.absolute(40)
        let itemSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [header]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func createButtonLayout() -> UICollectionViewCompositionalLayout {
        let widthDimension = NSCollectionLayoutDimension.fractionalWidth(0.49)
        let heightDimension = NSCollectionLayoutDimension.absolute(200)
        let itemSize = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), heightDimension: heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(CGFloat(5))
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func mainCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        group.interItemSpacing = .fixed(0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: PADDING * 2,
            leading: PADDING,
            bottom: PADDING * 2,
            trailing: PADDING
        )
        section.interGroupSpacing = PADDING
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
}

extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainCollectionViewCellData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.cellIdentifier, for: indexPath) as? MainCollectionViewCell else {
            fatalError()
        }
        let frame = CGRect(x: 0, y: 0, width: 400, height: 270)
        let cellItems = mainCollectionViewCellData[indexPath.item]
        if(indexPath.item != 2){
            let teamListCollectionView = ListCollectionUiView(frame: frame, collectionViewLayout: createListLayout())
            cell.configureDefaults(image: cellItems.image, text: cellItems.title, collectionView: teamListCollectionView)
        }else{
            let buttonCollectionView = ButtonUICollectionView(frame: frame, collectionViewLayout: createButtonLayout())
            cell.configureDefaults(image: cellItems.image, text: cellItems.title, collectionView: buttonCollectionView)
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in (0..<isExpanded.count) {
               if i == indexPath.item {
                   isExpanded[i].toggle()
               } else {
                   isExpanded[i] = false
               }
               if let cell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? MainCollectionViewCell {
                   cell.expandCell(isExpanded: isExpanded[i])
               }
           }
        collectionView.performBatchUpdates(nil, completion: nil)
    }

}

