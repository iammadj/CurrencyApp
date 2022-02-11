//
//  BasePresenterProtocol.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
}

extension BasePresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDisappear() {}
}
