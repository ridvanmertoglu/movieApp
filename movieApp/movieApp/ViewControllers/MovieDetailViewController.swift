//
//  MovieDetailViewController.swift
//  movieApp
//
//  Created by Ete Developer on 19.08.2021.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    var choosenId = 0
    var detailViewModal = MovieDetailViewModel()
    private var movieDetail: MovieDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetails()
    }
    
    private func fetchMovieDetails() {
        detailViewModal.fetchMovieDetailResults(id: choosenId)
      
        detailViewModal.addChangeHandler { [weak self] (state) -> Void in
                    DispatchQueue.main.async {
                        switch state {
                        case .fetching:
                            print("fetching..")
                        case .failed(let message):
                            print(message!)
                        case .succeeded:
                            self?.movieDetail = self?.detailViewModal.movieDetail
                            if let md = self?.movieDetail {
                                self?.load(movieDetail: md)
                            }
                        }
                    }
                }
    }
    
    private func prepareMovieDetailImage(with urlString: String) {
        if let url = URL(string: urlString) {
            movieImageView.sd_setImage(with: url)
        }
    }
    
    
    private func load(movieDetail: MovieDetail) {
        prepareMovieDetailImage(with: "https://www.themoviedb.org/t/p/w500/\(movieDetail.poster_path)")
        rateLabel.text = "\(movieDetail.vote_average) / 10"
        dateLabel.text = movieDetail.release_date
        titleLabel.text = movieDetail.original_title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        overviewLabel.text = movieDetail.overview
        
    }
}
