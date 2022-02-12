//
//  MainViewRouter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit

protocol MainViewRouterProtocol: BaseRouterProtocol {
    
}

class MainViewRouter: MainViewRouterProtocol {
    var viewController: UIViewController?
    
    class func create() -> UIViewController {
        let viewController = MainViewController()
        let router = MainViewRouter()
        let interactor = MainViewInteractor()
        let presenter = MainViewPresenter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = viewController
                
        return viewController
    }
    
}
