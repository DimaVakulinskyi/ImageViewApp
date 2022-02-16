//
//  ViewController.swift
//  ImageViewApp
//
//  Created by Дмитро Вакулінський on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    var photoArray = [Photo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        photoArray.append(Photo(name: "Cars", photos: [UIImage(named: "ateam")!,
                                                       UIImage(named: "ecto1")!,
                                                       UIImage(named: "bat")!,
                                                       UIImage(named: "dmc")!,
                                                       UIImage(named: "hornet")!,
                                                       UIImage(named: "kitt")!,
                                                       UIImage(named: "max")!,
                                                       UIImage(named: "mystery")!,
                                                       UIImage(named: "ron")!]))
        photoArray.append(Photo(name: "Pokemons", photos: [UIImage(named: "001")!,
                                                           UIImage(named: "006")!,
                                                           UIImage(named: "007")!,
                                                           UIImage(named: "015")!,
                                                           UIImage(named: "025")!,
                                                           UIImage(named: "050")!,
                                                           UIImage(named: "079")!]))
        CollectionView.delegate = self
        CollectionView.dataSource =  self
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.imageViewPhoto.image = photoArray[indexPath.section].photos[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.2, height: collectionView.frame.height * 0.2)
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeader", for: indexPath) as! CollectionHeader
        header.text.text = photoArray[indexPath.section].name
        return header
        }
}
