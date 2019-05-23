//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 4/27/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}


struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
