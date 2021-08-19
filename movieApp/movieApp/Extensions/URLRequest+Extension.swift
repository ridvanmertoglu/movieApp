//
//  URLRequest+Extension.swift
//  movieApp
//
//  Created by Ete Developer on 18.08.2021.
//

import Foundation

extension URLRequest {
    init(path: String) {
        let url = URL(string: path)
        self = URLRequest(url: url!,
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
        httpMethod = "GET"
    }
}

