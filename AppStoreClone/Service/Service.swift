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
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    //helper
    func fetchAppGroup(urlString: String, completion:@escaping (AppGroup?, Error?) -> Void){
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    //declare generic json func
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> ()) {
        
        print("T is type: ", T.self)
        
        guard let url = URL(string: urlString) else{ return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                //success
                completion(objects, nil)
                
            } catch {
                completion(nil, error)
            }
            }.resume() //fire request
    }
}


// stack
//generic is to declare the type later on
class Stack<T: Decodable> {
    var items = [T]()
    func push(item: T){ items.append(item) }
    func pop() -> T? { return items.last }
}

func testFunc() {
    let stackOfStrings = Stack<String>()
    stackOfStrings.push(item: "stringggg")
    
    let stackOfInts = Stack<Int>()
    stackOfInts.push(item: 1)
}
