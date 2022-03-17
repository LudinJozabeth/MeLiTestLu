//
//  ListSearchPresenter.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import Foundation
import UIKit

protocol ListSearchPresenterLogic {
    func goToDetailView(items: Result, fromView: UIViewController)
    var title: String { get set }
    var items: [Result] { get set }
}

class ListSearchPresenter: ListSearchPresenterLogic {
    var items: [Result]
    var model = DataModel.shared
    weak var  view: ListSearchViewLogic?
    
    var title: String = ""
    
    init(_ model: DataModel){
        self.model = model
        self.items = model.items!
    }
    
    //Router
    func goToDetailView(items: Result, fromView: UIViewController){
        let vc = DetailItemFactory().getInitVC(items)
        vc.popoverPresentationController?.sourceView = fromView.view // so that iPads won't crash
        fromView.present(vc, animated: true, completion: nil)
//        fromView.navigationController?.pushViewController(vc, animated: true)
    }
}
