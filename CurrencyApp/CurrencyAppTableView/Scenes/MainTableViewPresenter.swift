//
//  MainTableViewPresenter.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import Foundation

protocol MainTableViewPresenterProtocol: BasePresenterProtocol {
    
    //MARK: - View to Presenter
    
    func fetchData()
    
    //MARK: - Interactor to Presenter
    
    func fetchedDataForToday(items: [Main])
    
}

class MainTableViewPresenter: MainTableViewPresenterProtocol {
    
    //MARK: - Properties
    
    weak var view: MainTableViewProtocol?
    var interactor: MainTableViewInteractorProtocol!
    var router: MainTableViewRouterProtocol!
    
    //MARK: - Protocol Methods
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        interactor.fetchDataForToday()
    }
    
    func fetchedDataForToday(items: [Main]) {
        view?.updateView(with: items)
    }
    
}
