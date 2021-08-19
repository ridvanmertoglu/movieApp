//
//  ViewController.swift
//  movieApp
//
//  Created by Ete Developer on 17.08.2021.
//

import UIKit

class MovieViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    private lazy var viewModel = MovieViewModel()
    private var movies : [Movie]?
    var selectedId = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
        fetchMovies()
    }
    
    private func prepareCollectionView() {
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.register(cellType: MovieCollectionViewCell.self)
    }
    
    private func fetchMovies() {
        viewModel.fetchMovieResults()
       
        viewModel.addChangeHandler { [weak self] (state) -> Void in
                    DispatchQueue.main.async {
                        switch state {
                        case .fetching:
                            print("fetching..")
                        case .failed(let message):
                            print(message!)
                        case .succeeded:
                            self?.movies = self?.viewModel.movies?.results
                            self?.movieCollectionView.reloadData()
                        }
                    }
                }
    }
}


extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: MovieCollectionViewCell.self, indexPath: indexPath)
        if let movie = movies?[indexPath.item] {
                    cell.configure(movie: movie)
                }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        selectedId = viewModel.movies?.results[indexPath.item].id ?? 0
        performSegue(withIdentifier: "toMovieDetailViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetailViewController" {
            let detailVC = segue.destination as? MovieDetailViewController
            detailVC?.choosenId = selectedId
        }
    }
}

extension MovieCollectionViewCell: UICollectionViewDelegate {
    
}

