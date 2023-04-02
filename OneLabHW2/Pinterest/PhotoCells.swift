//
//  PhotoCells.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 02.04.2023.
//

import UIKit
import SnapKit

class PhotoCells: UICollectionViewCell {
    private var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
    }

    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
            }
        }
    }
}

