//
//  BaseRouterProtocol.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit

protocol BaseRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    func push(to viewController: UIViewController)
    func present(viewControllelr: UIViewController)
}

extension BaseRouterProtocol {
    func push(to viewController: UIViewController) {}
    func present(viewControllelr: UIViewController) {}
}
