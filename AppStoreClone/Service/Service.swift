//
//  Service.swift
//  AppStoreClone
//
//  Created by Danny Copeland on 3/31/19.
//  Copyright © 2019 Danny Copeland. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service() //singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        //fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            //success
            guard let data = data else { return }
            
            do {
                let searchResult =  try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            }.resume() //fire off the request using resume...

    }
}
