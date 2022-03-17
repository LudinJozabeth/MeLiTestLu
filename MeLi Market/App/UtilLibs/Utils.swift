//
//  Utils.swift
//  MeLiApp
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import Foundation
import UIKit

class Utils {    
    func parse(jsonData: Data) -> [Result]? {
        do {
            let decodedData = try JSONDecoder().decode(SearchItem.self, from: jsonData)
            return decodedData.results
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

