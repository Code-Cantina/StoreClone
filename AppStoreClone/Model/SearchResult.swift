//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 3/30/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float? //may not always have a user rating... optional
    let screenshotUrls: [String]
    let artworkUrl100: String //app icon
}
