//
//  MovieViewModel.swift
//  movieApp
//
//  Created by Ete Developer on 17.08.2021.
//

import Foundation

struct MovieViewModelState {
    enum Change: StateChange {
        case fetching
        case succeeded
        case failed(message: String?)
    }
}

final class MovieViewModel: StatefulViewModel<MovieViewModelState.Change> {
    
    var movies: Response?
    
    func fetchMovieResults() {
        let path = "https://api.themoviedb.org/3/movie/upcoming?api_key=33356b25e826a25324e9c9bfffd058b0&language=en-US&page=1"
        emit(change: .fetching)
        NetworkManager.shared.fetchResponse(request:  URLRequest(path: path)) { [weak self] (data, error) in
            if let err = error {
                self?.emit(change: .failed(message: err.localizedDescription))
                return
            }
            guard let data = data else {
                self?.emit(change: .failed(message: "Data is empty."))
                return
            }
            self?.movies = Response.decodeObject(data: data)
            self?.emit(change: .succeeded)
            
        }
    }
}
