//
//  PhotoModel.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 02.04.2023.
//

import UIKit
struct Photo {
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
}
var photos:[Photo] = [
    Photo(image: UIImage(named: "photo1")!),
    Photo(image: UIImage(named: "photo2")!),
    Photo(image: UIImage(named: "photo3")!),
    Photo(image: UIImage(named: "photo4")!),
    Photo(image: UIImage(named: "photo5")!),
    Photo(image: UIImage(named: "photo6")!),
    Photo(image: UIImage(named: "photo7")!),
]
