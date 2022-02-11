//
//  MainViewService.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol MainViewServiceProtocol {
    
}

struct MainViewService: MainViewServiceProtocol {
    
    private let apiManager: APIManager
    private let jsonMapper: JSONMapper
    
    init(apiManager: APIManager = APIManagerImp(), jsonMapper: JSONMapper)
    
}
