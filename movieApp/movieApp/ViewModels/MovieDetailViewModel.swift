//
//  MovieDetailViewModel.swift
//  movieApp
//
//  Created by Ete Developer on 19.08.2021.
//

import Foundation

struct MovieDetailViewModelState {
    enum Change: StateChange {
        case fetching
        case succeeded
        case failed(message: String?)
    }
}

final class MovieDetailViewModel: StatefulViewModel<MovieDetailViewModelState.Change> {
    
    var movieDetail: MovieDetail?
    
    func fetchMovieDetailResults(id: Int) {
        let path = "https://api.themoviedb.org/3/movie/\(id)?api_key=33356b25e826a25324e9c9bfffd058b0&language=en-US"
        emit(change: .fetching)
        NetworkManager.shared.fetchResponse(request: URLRequest(path: path)) { [weak self] (data, error) in
            if let err = error {
                self?.emit(change: .failed(message: err.localizedDescription))
                return
            }
            guard let data = data else {
                self?.emit(change: .failed(message: "Data is empty."))
                return
            }
            
            self?.movieDetail = MovieDetail.decodeObject(data: data)
            self?.emit(change: .succeeded)
            
        }
    }
}

