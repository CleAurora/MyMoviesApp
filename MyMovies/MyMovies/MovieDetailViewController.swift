//
//  MovieDetailViewController.swift
//  MyMovies
//
//  Created by Cleís Aurora Pereira on 20/10/20.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var movieDetailImage: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!

    var arrayMovieAlike = [Movie]()
    var movie: Movie?

    func setup(movieSet: Movie){
        movie = movieSet
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        if let movieSet = movie {
            movieDetailImage.image = movieSet.image
            nameLabel.text = movieSet.name

            arrayMovieAlike = MovieDB.shared.movies.filter({ movie in
                movieSet.gender == movie.gender && movieSet.name != movie.name
            })

            collectionView.reloadData()
        }
    }

}

extension MovieDetailViewController: UICollectionViewDelegate{

}

extension MovieDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMovieAlike.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)

        if let collectionViewCell = cell as? CollectionViewCell {
            collectionViewCell.setup(movie: arrayMovieAlike[indexPath.row])
        }

        return cell
    }


}


