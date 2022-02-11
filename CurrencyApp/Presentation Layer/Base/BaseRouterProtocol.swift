//
//  BaseRouterProtocol.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit

protocol BaseRouterProtocol: AnyObject {
    var _viewController: UIViewController? { get }
    
    func push(to viewController: UIViewController)
    func present(viewControllelr: UIViewController)
}

extension BaseRouterProtocol {
    func push(to viewController: UIViewController) {}
    func present(viewControllelr: UIViewController) {}
}
