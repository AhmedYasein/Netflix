//
//  PopularMovies.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/2/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation

struct popularMoviesResponse: Codable {
    let page: Int
    let results: [popularMovie]?
    let total_pages: Int
    let total_results: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case total_pages
        case total_results
    }
}
struct popularMovie: Codable, GenaricResponse {
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let votAverage: Double
    let video: Bool?
    let voteCount: Int?

    
    enum CodingKeys: String, CodingKey {
        case popularity
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case title = "title"
        case posterPath = "poster_path"
        case overview = "overview"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case votAverage = "vote_average"
        case video
        
    }
    
}
