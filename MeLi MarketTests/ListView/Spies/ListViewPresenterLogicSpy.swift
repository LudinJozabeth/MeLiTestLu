//
//  ListViewPresenterLogicSpy.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import UIKit

class ListViewPresenterLogicSpy: ListSearchPresenterLogic {
    var model = DataModel.shared
    
    var items: [Result] = ModelCreatorHelper.createMockGetItemsResponse()
    var title: String = "Testing"
    
    var goToDetaiViewCalled = false

    // MARK: - Methods
    func goToDetailView(items: Result, fromView: UIViewController) {
        goToDetaiViewCalled = true
    }
}
