//
//  MainTableViewCell.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit
import TinyConstraints

class MainTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    private let roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan.withAlphaComponent(0.1)
        view.roundCorners(radius: 16.0)
        
        return view
    }()
    
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        embedSubviews()
        setSubviewsConstraints()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        currencySymbolLabel.attributedText = nil
        rateLabel.attributedText = nil
    }
    
    //MARK: - Configure
    
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

extension MainTableViewCell {
    
    private func embedSubviews() {
        contentView.addSubview(roundedView)
        roundedView.addSubview(hStack)
        hStack.addArrangedSubviews(currencySymbolLabel, rateLabel)
    }
    
    private func setSubviewsConstraints() {
        setRoundedViewConstraints()
        setHStackConstraints()
    }
    
    private func setRoundedViewConstraints() {
        roundedView.edges(to: contentView, insets: .horizontal(16.0) + .vertical(8.0))
    }
    
    private func setHStackConstraints() {
        hStack.top(to: roundedView, offset: 16.0, relation: .equalOrGreater, priority: .defaultHigh)
        hStack.left(to: roundedView, offset: 24.0)
        hStack.right(to: roundedView, offset: -24.0)
        hStack.bottom(to: roundedView, offset: -16.0, relation: .equalOrLess, priority: .defaultHigh)
        hStack.centerY(to: roundedView)
    }
    
}
