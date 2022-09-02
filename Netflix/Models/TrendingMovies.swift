//
//  TrendingMovies.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/20/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation
 struct TrendingMoviesResponse: Codable {
    let page: Int
    let results: [Movie]?
    let total_pages: Int
    let total_results: Int
    
     enum CodingKeys: String, CodingKey {
        case results 
        case page
        case total_pages
        case total_results
    }
}
struct Movie: Codable {
    let id: Int
    let mediaType: String?
    let originalName: String?
    let originalTitle: String?
    let posterPath: String?
    let overview: String?
    let voteCount: Int
    let releaseDate: String?
    let votAverage: Double
    
  enum CodingKeys: String, CodingKey {
        case id = "id"
        case mediaType = "media_type"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case overview = "overview"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case votAverage = "vote_average"
    
    }
    
}
