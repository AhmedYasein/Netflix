//
//  Constants.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/20/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation

struct APIKeys {
    static let apiKey = "2ad733eda0f17027b021ed10c523d9a5"
}

struct URLs {
    static let baseURL = "https://api.themoviedb.org/"
    static let trending = "3/trending/all/day?api_key="
    static let trendingMovies =  baseURL + trending + APIKeys.apiKey
    static let popular = "3/movie/popular?api_key="
    static let popularMovies = baseURL + popular + APIKeys.apiKey 
}
