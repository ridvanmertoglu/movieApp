//
//  MovieDetail.swift
//  movieApp
//
//  Created by Ete Developer on 19.08.2021.
//

import Foundation

final class MovieDetail: Decodable {
    var original_title: String
    var overview: String
    var release_date: String
    var poster_path: String
    var vote_average:Float
}
