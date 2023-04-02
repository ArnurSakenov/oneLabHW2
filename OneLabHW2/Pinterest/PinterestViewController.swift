//
//  PinterestViewController.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 02.04.2023.
//

import UIKit
import SnapKit
protocol PinterestLayoutDelegate: AnyObject {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class PinterestViewController: UIViewController {
    private let customLayout = CollectionLayout()
    private lazy var  collectionView:UICollectionView = {
 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customLayout)
return collectionView
    }()
    

    override func viewDidLoad() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.register(PhotoCells.self, forCellWithReuseIdentifier: "AnnotatedPhotoCell")

        collectionView.delegate = self
        collectionView.dataSource = self 
        if let layout = collectionView.collectionViewLayout as? CollectionLayout {
          layout.delegate = self
        }

    }
    

}

extension PinterestViewController: PinterestLayoutDelegate , UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath as IndexPath) as! PhotoCells
        cell.photo = photos[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: itemSize)
    }
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    return photos[indexPath.item].image.size.height
  }
}
