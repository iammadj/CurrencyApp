//
//  MainCollectionViewCell.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16.0
        
        return stack
    }()
    
    private let currencySymbolLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        
        return label
    }()
    
    //MARK: - Init & Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        embedSubviews()
        addSubviewsConstraints()
        contentView.backgroundColor = .cyan.withAlphaComponent(0.1)
        roundCorners(radius: 16.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        currencySymbolLabel.attributedText = nil
        rateLabel.attributedText = nil
    }
    
    //MARK: - Methods
    
    func configure(item: Main) {
        let symbol = item.currency.currencySymbol
        
        currencySymbolLabel.attributedText = "1 \(symbol) \(item.currency)".applyStyle(
            .init(font: .systemFont(ofSize: 24.0, weight: .bold))
        ) + "\n\(item.currencyRu)".applyStyle(
            .init(font: .systemFont(ofSize: 14.0, weight: .regular))
        )
        
        rateLabel.attributedText = item.rate.applyStyle(
            .init(font: .systemFont(ofSize: 24.0, weight: .semibold))
        ) + "\n Сум".applyStyle(
            .init(font: .systemFont(ofSize: 14.0, weight: .regular))
        )
        
        layoutIfNeeded()
    }
    
}

//MARK: - Private Methods

extension MainCollectionViewCell {
    
    private func embedSubviews() {
        contentView.addSubview(hStack)
        hStack.addArrangedSubviews(currencySymbolLabel, rateLabel)
    }
    
    private func addSubviewsConstraints() {
        hStack.top(to: contentView, offset: 32.0, relation: .equalOrGreater)
        hStack.left(to: contentView, offset: 24.0)
        hStack.right(to: contentView, offset: -24.0)
        hStack.bottom(to: contentView, offset: -32.0, relation: .equalOrLess)
        hStack.centerY(to: contentView)
    }
    
}
