//
//  DetailItemViewPresenter.swift
//  MeLi Market
//
//  Created by Ludin Jozabeth on 14-03-22.
//

protocol DetailItemViewPresenterLogic {
    var item: Result { get set }
}

class DetailItemViewPresenter: DetailItemViewPresenterLogic {
    var item: Result
    var model = DataModel.shared
    var title: String = ""
    
    init(_ model: DataModel, item: Result){
        self.model = model
        self.item = item
    }
}

