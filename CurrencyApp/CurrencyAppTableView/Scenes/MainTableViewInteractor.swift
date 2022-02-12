//
//  MainTableViewInteractor.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import Foundation

protocol MainTableViewInteractorProtocol {
    
    func fetchDataForToday()
    
}

class MainTableViewInteractor: MainTableViewInteractorProtocol {
    
    //MARK: - Properties
    
    var presenter: MainTableViewPresenterProtocol!
    
    private let service: MainViewService = MainViewServiceImp()
    
    //MARK: - Protocol Methods
    
    func fetchDataForToday() {
        service.fetchData(.allToday) { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter.fetchedDataForToday(items: items)
            case .failure:
                self?.presenter.fetchedDataForToday(items: [])
            }
        }
    }
}
