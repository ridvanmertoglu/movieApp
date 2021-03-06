//
//  Decodable+Extension.swift
//  movieApp
//
//  Created by Ete Developer on 18.08.2021.
//

import Foundation

extension Decodable {
    static func decodeObject<T: Decodable>(data: Data?) -> T? {
        guard let data = data else { return nil }
        let object = try? JSONDecoder().decode(T.self, from: data)
        return object
    }
}
