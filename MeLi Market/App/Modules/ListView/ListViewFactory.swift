//
//  ListViewFactory.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import Foundation
import UIKit

class ListViewFactory {
    func getInitVC(_ title: String) -> UIViewController {
        let presenter = ListSearchPresenter(DataModel.shared)
        let viewController = ListSearchView(presenter)
        presenter.title = title
        presenter.view = viewController
        return viewController
    }

}
