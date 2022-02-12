//
//  MainViewController.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit
import TinyConstraints

protocol MainViewProcotol: AnyObject {
    
    func updateView(with items: [Main])
    func reloadData()
    
}

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainViewPresenterProtocol!
    
    private let errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.isHidden = true
        
        return errorView
    }()
    
    private let layout: UICollectionViewLayout = {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        config.interSectionSpacing = 16.0
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (section, _) -> NSCollectionLayoutSection in
            let width = UIScreen.main.bounds.width * 0.8
            let height = width * 0.75
            let size = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height))
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(64.0))
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
            )
            
            section.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
            section.interGroupSpacing = 16.0
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
        }, configuration: config)
        
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 16.0, left: 0.0, bottom: 16.0, right: 0.0)
        collectionView.register(MainCollectionViewCell.self)
        collectionView.register(
            MainViewHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MainViewHeaderView.reuseId
        )
        collectionView.isHidden = true
        
        return collectionView
    }()
    
    private var items: [Main] = []
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        embedSubviews()
        addSubviewsConstraints()
        handleReloadButtonDidTap()
        presenter.viewDidLoad()
    }

}

//MARK: - Protocol Methods

extension MainViewController: MainViewProcotol {
    
    func updateView(with items: [Main]) {
        self.items = items
                
        DispatchQueue.main.async {
            self.collectionView.isHidden = items.isEmpty
            self.errorView.isHidden = !items.isEmpty
            self.reloadData()
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}

//MARK: - CollectionView DataSource & Delegate Methods

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let item = items[indexPath.row]
        cell.configure(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: MainViewHeaderView.reuseId, for: indexPath
              ) as? MainViewHeaderView else {
            return UICollectionReusableView()
        }
        
        let date = items.first?.date
        
        if let date = date {
            view.configure(date: date)
        }
        
        return view
    }
    
}

//MARK: - Private Methods

extension MainViewController {
    
    private func embedSubviews() {
        view.addSubviews(errorView, collectionView)
    }
    
    private func addSubviewsConstraints() {
        errorView.edgesToSuperview(usingSafeArea: true)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func handleReloadButtonDidTap() {
        errorView.reloadButtonDidTap = { [weak self] in
            self?.presenter.fetchData()
        }
    }
    
}
