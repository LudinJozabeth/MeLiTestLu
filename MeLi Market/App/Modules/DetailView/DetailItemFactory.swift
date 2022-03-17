//
//  DetailItemFactory.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

import Foundation
import UIKit

class DetailItemFactory {

    func getInitVC(_ item: Result) -> UIViewController {
        let presenter = DetailItemViewPresenter(DataModel.shared, item: item)
        let viewController = DetailItemView(presenter)
        return viewController
    }
}
