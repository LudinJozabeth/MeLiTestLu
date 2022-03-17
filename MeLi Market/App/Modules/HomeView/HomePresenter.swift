//
//  HomePresenter.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 13-03-22.
//

import Foundation
import UIKit

protocol HomePresenterLogic {
    func goSearch(searchText: String, fromView: HomeViewController)
    var model: DataModel { get set }
}

class HomePresenter: HomePresenterLogic {
    var model = DataModel.shared
    weak var  view: HomeViewController?
    
    init(_ view: HomeViewController? = nil){
        self.view = view
    }
    
    func goSearch(searchText: String, fromView: HomeViewController) {
        self.view = fromView
        DispatchQueue.main.async {
            self.model.load(search: searchText, model: self.model, completion: { self.goToListView(search: searchText) } )
        }
    }
    
    func goToListView(search: String){
        if (model.items?.count ?? 0 == 0 ) {
            let dialogMessage = UIAlertController(title: "Ooopss!", message: "Lo sentimos, tu búsqueda no arrojó ningún resultado", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
             dialogMessage.addAction(ok)
            self.view!.present(dialogMessage, animated: true, completion: nil)
        }else {
            let vc = ListViewFactory().getInitVC(search)
            self.view!.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

