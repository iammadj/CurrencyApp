//
//  MainViewHeaderView.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit
import TinyConstraints

class MainViewHeaderView: UICollectionReusableView {
    
    //MARRK: - Identifier
    
    static let reuseId = "MainViewHeaderView-Reuse-Id"
    
    //MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        
        return label
    }()
    
    //MARK: - Init & life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
    
    //MARK: - Configure
    
    func configure(date: String) {
        titleLabel.text = "Последнее обновление:\n\(date)"
        
        layoutIfNeeded()
    }
    
    //MARK: - Private Methods
    
    private func layout() {
        addSubview(titleLabel)
        titleLabel.edgesToSuperview(insets: .horizontal(24.0) + .bottom(32.0))
    }
        
}
