//
//  ErrorView.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit
import TinyConstraints

class ErrorView: UIView {
    
    //MARK: - Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "xmark.octagon.fill")
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Ooops! Something went wrong! Try to reload"
        
        return label
    }()
    
    private let reloadButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "gobackward")
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    var reloadButtonDidTap: (() -> ())?
    
    //MARK: - Init & Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        embedSubviews()
        addSubviewsConstraints()
        
        reloadButton.addTarget(for: .touchUpInside) { [weak self] _ in
            self?.reloadButtonDidTap?()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func embedSubviews() {
        addSubviews(imageView, titleLabel, reloadButton)
    }
    
    private func addSubviewsConstraints() {
        setImageViewConstraints()
        setTitleLabelConstraints()
        setReloadButtonConstraints()
    }
    
    private func setImageViewConstraints() {
        imageView.horizontalToSuperview(insets: .horizontal(32.0))
        imageView.topToSuperview(offset: 32.0, relation: .equalOrGreater)
        imageView.size(CGSize(width: 64.0, height: 64.0), priority: .defaultHigh)
        
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.topToBottom(of: imageView, offset: 32.0)
        titleLabel.leftToSuperview(offset: 32.0, relation: .equalOrGreater)
        titleLabel.rightToSuperview(offset: -32.0, relation: .equalOrLess)
        titleLabel.centerInSuperview()
    }
    
    private func setReloadButtonConstraints() {
        reloadButton.topToBottom(of: titleLabel, offset: 32.0)
        reloadButton.leftToSuperview(offset: 32.0, relation: .equalOrGreater)
        reloadButton.rightToSuperview(offset: -32.0, relation: .equalOrLess)
        reloadButton.bottomToSuperview(offset: -32.0, relation: .equalOrLess)
        reloadButton.centerXToSuperview()
        reloadButton.size(CGSize(width: 48.0, height: 48.0), priority: .defaultHigh)
    }
    
}
