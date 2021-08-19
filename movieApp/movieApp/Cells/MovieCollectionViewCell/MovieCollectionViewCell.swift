//
//  MovieCollectionViewCell.swift
//  movieApp
//
//  Created by Ete Developer on 19.08.2021.
//

import UIKit
import SDWebImage

extension MovieCollectionViewCell {
    fileprivate enum Constants {
        enum Shadow {
            static let opacity: Float = 1
            static let radius: CGFloat = 10
            static let offset = CGSize(width: 0, height: 5)
            static let cornerRadius: CGFloat = 5
        }
        enum UI {
            static let cornerRadius: CGFloat = 8
        }
    }
}

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieDescription: UILabel!
    @IBOutlet private weak var movieDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    
    private func setupUI() {
        movieImage.layer.cornerRadius = Constants.UI.cornerRadius
     }
    
    func configure(movie: Movie) {
        prepareMovieImage(with: "https://www.themoviedb.org/t/p/w500/\(movie.poster_path)")
        movieTitle.text = movie.original_title
        movieDescription.text = movie.overview
        movieDate.text = movie.release_date
    }
    
    private func prepareMovieImage(with urlString: String) {
        if let url = URL(string: urlString) {
            movieImage.sd_setImage(with: url)
        }
    }
}
