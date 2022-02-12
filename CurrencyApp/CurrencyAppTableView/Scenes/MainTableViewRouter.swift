//
//  MainTableViewRouter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit

protocol MainTableViewRouterProtocol: BaseRouterProtocol {
    
}

class MainTableViewRouter: MainTableViewRouterProtocol {
    var viewController: UIViewController?
    
    static func create() -> UIViewController {
        let view = MainTableViewController()
        let presenter = MainTableViewPresenter()
        let interactor = MainTableViewInteractor()
        let router = MainTableViewRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
}
