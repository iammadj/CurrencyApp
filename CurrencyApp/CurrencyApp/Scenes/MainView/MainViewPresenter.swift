//
//  MainViewPresenter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

protocol MainViewPresenterProtocol: BasePresenterProtocol {
    
    //MARK: - View to Presenter
    
    func fetchData()
    
    //MARK: - Interactor to Presenter
    
    func fetchedDataForLastWeek(items: [Main])
    func fetchedAllDataForToday(items: [Main])
    func fetchedDataForSelectedCurrency(items: [Main])
    
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    //MARK: - Properties
    
    weak var view: MainViewProcotol?
    var interactor: MainViewInteractorProtocol!
    var router: MainViewRouterProtocol!
    
    //MARK: - Protocol Methods
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.fetchAllForToday()
    }
    
    func fetchedDataForLastWeek(items: [Main]) {
        view?.updateView(with: items)
    }
    
    func fetchedAllDataForToday(items: [Main]) {
        view?.updateView(with: items)
    }
    
    func fetchedDataForSelectedCurrency(items: [Main]) {
        view?.updateView(with: items)
    }
    
}
