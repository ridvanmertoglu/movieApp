//
//  Movie.swift
//  movieApp
//
//  Created by Ete Developer on 18.08.2021.
//

import Foundation

final class Response: Decodable {
    var results: [Movie]
}

final class Movie: Decodable {
    var id: Int
    var original_title: String
    var overview: String
    var release_date: String
    var poster_path: String
}
