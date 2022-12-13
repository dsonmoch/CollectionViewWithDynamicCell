//
//  DataModel.swift
//  StreamCreation
//
//  Created by Admin on 28/11/22.
//

import Foundation
import UIKit

struct MainCollectionViewCellData{
    let title: String
    let image: UIImage
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}

let mainCollectionViewCellData = [
    MainCollectionViewCellData(title: "STREAM INFO", image: UIImage(systemName: "info")!),
    MainCollectionViewCellData(title: "EVENT", image: UIImage(systemName: "photo")!),
    MainCollectionViewCellData(title: "STREAMIING METHOD", image: UIImage(systemName: "video")!)
]

struct NibDetails{
    let nibName: String
    let cellReuseIdentifier: String
}

let nibDetails = [
    NibDetails(nibName: "HorizontalCollectionViewCell", cellReuseIdentifier: "HorizontalCollectionViewCell"),
    NibDetails(nibName: "CollectionViewXibCell", cellReuseIdentifier: "CollectionViewCell")
]

struct HorizontalCellViewData{
    let headerTitle: String
    let titleLabelText: [String]
    init(headerTitle: String, titleLabelText: [String]) {
        self.headerTitle = headerTitle
        self.titleLabelText = titleLabelText
    }
}

let horizontalCellViewData = [
    HorizontalCellViewData(headerTitle: "BASKETBALL IRELAND", titleLabelText: [
        "Belfast Star",
        "Bright St. Vincent's",
        "DBS Eanna",
        "Energywise Ireland Neptune",
        "Ej Sligo All-Stars",
    ])
]

struct ButtonCellViewData{
    let image: UIImage
    let titleLabel: String
    let subtitleLabel: String
    
    init(image: UIImage, titleLabel: String, subtitleLabel: String) {
        self.image = image
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
    }
}

let buttonCellViewData = [
    ButtonCellViewData(image: UIImage(systemName: "iphone")!, titleLabel: "Joymo Share App", subtitleLabel: "Stream from any iOS or Android phone"),
    ButtonCellViewData(image: UIImage(systemName: "camera")!, titleLabel: "External camera", subtitleLabel: "Stream through RTMP connection"),
]


