//
//  HomeViewLogicSpy.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

@testable import MeLi_Market
import UIKit

class HomeViewLogicSpy: HomeViewLogic {
    var presentViewControllerCalled = false
    
    // MARK: - Methods
    func presentViewController(vc: UIViewController) {
        presentViewControllerCalled = true
    }

}
