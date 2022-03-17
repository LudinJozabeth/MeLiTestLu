//
//  HomeModelLogicSpy.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import Darwin

class HomeModelLogicSpy: DataModel {

    // MARK: - HomeModelLogic
    var getDataCalled = false

    enum HomePossibleResults {
        case success, failure
    }
    var possibleResult: HomePossibleResults = .success

    func getData(search: String, model: DataModel = DataModel(), completion : @escaping (( [Result]?) -> Void )) {
        let storedEntity: [Result]? = ModelCreatorHelper.createMockGetItemsResponse()
        getDataCalled = true
        switch possibleResult {
        case .success:
            print("success getData", storedEntity![0].id as Any)
            completion( storedEntity)
        case .failure:
            print("failure getData")
            completion( nil)
        }
        
    }
}
