//
//  Utils.swift
//  MeLiApp
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import Foundation

class Utils {
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> [Result]? {
        do {
            let decodedData = try JSONDecoder().decode(SearchItem.self, from: jsonData)
            return decodedData.results
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
