//
//  DetailsViewPresenterLogicSpy.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import UIKit

class DetailsViewPresenterLogicSpy: DetailItemViewPresenterLogic {
    var item: Result
    var model = DataModel.shared
    var title: String = ""
    
    init(_ model: DataModel, item: Result){
        self.model = DataModel.shared
        model.items = ModelCreatorHelper.createMockGetItemsResponse()
        self.item = model.items![0]
    }
}
