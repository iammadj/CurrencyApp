//
//  MainViewPresenter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol MainViewPresenterProtocol: BasePresenterProtocol {
    
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProcotol?
    var interactor: MainViewInteractorProtocol!
    var router: MainViewRouterProtocol!
    
}
