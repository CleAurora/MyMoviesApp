//
//  CollectionViewCell.swift
//  MyMovies
//
//  Created by Cleís Aurora Pereira on 20/10/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!

    func setup(movie: Movie){
        image.image = movie.image
    }
}
