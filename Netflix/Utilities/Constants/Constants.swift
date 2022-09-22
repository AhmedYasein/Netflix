//
//  Constants.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/20/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation

struct APIKeys {
    static let apiKey = "2ad733eda0f17027b021ed10c523d9a5222"
}

struct URLs {
    static let baseURL = "https://api.themoviedb.org/"
    static let trending = "3/trending/all/day?api_key="
    static let trendingMovies =  baseURL + trending + APIKeys.apiKey
    static let popular = "3/movie/popular?api_key="
    static let popularMovies = baseURL + popular + APIKeys.apiKey
    static let upComing = "3/movie/upcoming?api_key="
    static let upComingMovies = baseURL + upComing + APIKeys.apiKey
    static let tv = "3/trending/tv/day?api_key="
    static let trndingTV = baseURL + tv + APIKeys.apiKey
    static let topRated = "3/movie/top_rated?api_key="
    static let topRatedMovies = baseURL + topRated + APIKeys.apiKey
    static let discover = "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    static let discoverMovies = baseURL + "3/discover/movie?api_key=" + APIKeys.apiKey + discover
    static let searchQuary = baseURL + "3/search/movie?api_key=\(APIKeys.apiKey)&query="


}

