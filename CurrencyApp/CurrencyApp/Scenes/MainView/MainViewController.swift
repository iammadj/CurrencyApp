//
//  MainViewController.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit
import TinyConstraints

protocol MainViewProcotol: AnyObject {
    
    func updateViewWith(items: [MainViewModel])
    func updateViewWith(error: String)
    
}

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainViewPresenterProtocol!
    
    private let layout: UICollectionViewLayout = {
        let width = UIScreen.main.bounds.width - 32.0
        let height = width * 0.5
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16.0
        layout.minimumLineSpacing = 16.0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: height)
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 16.0, left: 0.0, bottom: 16.0, right: 0.0)
        
        return collectionView
    }()
    
    //MARK: - Life cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedSubviews()
        addSubviewsConstraints()
        presenter.viewDidLoad()
    }

}

//MARK: - Protocol Methods

extension MainViewController: MainViewProcotol {
    
    func updateViewWith(items: [MainViewModel]) {
        
    }
    
    func updateViewWith(error: String) {
        
    }
    
}

//MARK: - CollectionView DataSource & Delegate Methods

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
}

//MARK: - Private Methods

extension MainViewController {
    
    private func embedSubviews() {
        
    }
    
    private func addSubviewsConstraints() {
        
    }
    
}
