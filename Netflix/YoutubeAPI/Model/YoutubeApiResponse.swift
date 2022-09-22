//
//  YoutubeApiResponse.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/22/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [videoElement]
}

struct videoElement: Codable {
    let id: idVideElement
}

struct idVideElement: Codable {
    let kind: String
    let videoId: String
}
