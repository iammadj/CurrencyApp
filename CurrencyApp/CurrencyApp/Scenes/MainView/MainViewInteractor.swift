//
//  MainViewInteractor.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol MainViewInteractorProtocol {
    
    func fetchAllFromLastWeek()
    func fetchAllForToday()
    func fetchFor(currency: String)
    
}

class MainViewInteractor: MainViewInteractorProtocol {
    
    //MARK: - Properties
    
    var presenter: MainViewPresenterProtocol!
    
    private let mainViewService: MainViewService = MainViewServiceImp()
    
    //MARK: - Methods
    
    func fetchAllFromLastWeek() {
        mainViewService.fetchData(.allFromLastWeek) { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter.fetchedDataForLastWeek(items: items)
            case .failure:
                self?.presenter.fetchedDataForLastWeek(items: [])
            }
        }
    }
    
    func fetchAllForToday() {
        mainViewService.fetchData(.allToday) { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter.fetchedAllDataForToday(items: items)
            case .failure:
                self?.presenter.fetchedAllDataForToday(items: [])
            }
        }
    }
    
    func fetchFor(currency: String) {
        mainViewService.fetchData(.allTodayFor(currency)) { [weak self] result in
            switch result {
            case .success(let items):
                self?.presenter.fetchedDataForSelectedCurrency(items: items)
            case .failure:
                self?.presenter.fetchedDataForSelectedCurrency(items: [])
            }
        }
    }
    
}
