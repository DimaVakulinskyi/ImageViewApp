//
//  CollectionHeader.swift
//  ImageViewApp
//
//  Created by Дмитро Вакулінський on 11.12.2021.
//

import UIKit

class CollectionHeader: UICollectionReusableView{
    @IBOutlet weak var text: UILabel!
    var categoryTitle: String! {
        didSet {
            text.text = categoryTitle
        }
    }
}
