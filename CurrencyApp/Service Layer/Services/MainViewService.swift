//
//  MainViewService.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol MainViewService {
    
    func fetchData(_ endpoint: MainViewEndpoint, completion: @escaping (Result<[Main], Error>) -> Void)
    
}

struct MainViewServiceImp: MainViewService {
    
    //MARK: - Properties
    
    private let apiManager: APIManager
    private let jsonMapper: JSONMapper
    
    //MARK: - Init
    
    init(apiManager: APIManager = APIManagerImp(), jsonMapper: JSONMapper = JSONMapperImp()) {
        self.apiManager = apiManager
        self.jsonMapper = jsonMapper
    }
    
    //MARK: - Methods
    
    func fetchData(_ endpoint: MainViewEndpoint, completion: @escaping (Result<[Main], Error>) -> Void) {
        apiManager.request(with: endpoint) { result in
            let mappedResult = jsonMapper.mapToResult(from: result, for: nil, type: [Main].self)
            completion(mappedResult)
        }
    }
    
}
