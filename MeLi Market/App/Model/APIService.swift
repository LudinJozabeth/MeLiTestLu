//
//  APIService.swift
//  MeLiApp
//
//  Created by Ludin Jozabeth on 12-03-22.
//

import Foundation
import Alamofire

class APIServiceItems :  NSObject {
    @objc public static let shared = APIServiceItems()
    var items: [Result]?
    
    func apiToGetItemsData(searchItem: String, completion : @escaping ((Error?, [Result]?) -> Void)) {
        let strSearch = searchItem.replacingOccurrences(of: " ", with: "%20")
        let sourcesURL = URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(strSearch)"  )!
        _ = AF.request(sourcesURL, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
            .validate()
            .responseJSON { response in
                switch (response.result) {
                case .success( _):
                    do {
                        print("response ", response.data ?? "--")
                        let itemsData = try JSONDecoder().decode(SearchItem.self, from: response.data!)
                        
                        DispatchQueue.main.async {
                            self.items = itemsData.results
                            completion(nil,  itemsData.results)
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                        completion(error, nil)
                    }
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                    completion(error, nil)
                }
            }
    }
}

