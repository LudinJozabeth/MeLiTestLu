//
//  HomePresenterLogicSpy.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import UIKit

class HomePresenterLogicSpy: HomePresenterLogic {
    var model: DataModel
    
    var goSearchCalled = false
    var goToListViewCalled = false
    
    init(_ model: DataModel){
        self.model = DataModel.shared
    }

    // MARK: - Methods
    func goSearch(searchText: String, fromView: HomeViewController) {
        goSearchCalled = true
    }
}
