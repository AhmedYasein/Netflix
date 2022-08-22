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
    static let trendingMovies =  baseURL + "3/trending/all/day?api_key=" + APIKeys.apiKey

}
