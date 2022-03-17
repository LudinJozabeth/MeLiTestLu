//
//  DataModel.swift
//  MeLiApp
//
//  Created by Ludin Jozabeth on 12-03-22.
//

import Foundation

class DataModel {
    public static let shared = DataModel()
    var items: [Result]?
    
    func load(search: String, model: DataModel, completion : @escaping (() -> Void)) {
        print("search text", search)
        APIServiceItems.shared.apiToGetItemsData(searchItem: search, completion: { (error, data) in
            if !data!.isEmpty{
                print("search data ok")
                model.items = data!
                completion()
            } else {
                print("hey error in call service, ", error ?? "No info")
                completion()
            }
        })
    }
}
