//
//  ExtractLastTransactionCell.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

final class ExtractLastTransactionCell: UICollectionViewCell {
    // MARK: - UI Components
    private lazy var transactionTypeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.smallSize.rawValue, weight: .thin)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var transactionValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.mediumSize.rawValue)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var transactionCategoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Override Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func fill(with transaction: Transaction) {
        transactionTypeLabel.text = transaction.type.description
        transactionValueLabel.text = transaction.value
        transactionCategoryLabel.text = transaction.category.rawValue
        contentView.backgroundColor = transaction.type == .input ? UIColor(named: Constants.Colors.success.rawValue) : UIColor(named: Constants.Colors.error.rawValue)
    }
}

// MARK: - ViewCode Protocol
extension ExtractLastTransactionCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(transactionTypeLabel)
        contentView.addSubview(transactionValueLabel)
        contentView.addSubview(transactionCategoryLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transactionTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            transactionTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spaces.defaultSize.rawValue),
            transactionTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            
            transactionValueLabel.topAnchor.constraint(equalTo: transactionTypeLabel.bottomAnchor, constant: Constants.Spaces.smallSize.rawValue),
            transactionValueLabel.trailingAnchor.constraint(equalTo: transactionTypeLabel.trailingAnchor),
            transactionValueLabel.leadingAnchor.constraint(equalTo: transactionTypeLabel.leadingAnchor),
            
            transactionCategoryLabel.topAnchor.constraint(equalTo: transactionValueLabel.bottomAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            transactionCategoryLabel.trailingAnchor.constraint(equalTo: transactionValueLabel.trailingAnchor),
            transactionCategoryLabel.leadingAnchor.constraint(equalTo: transactionValueLabel.leadingAnchor),
            transactionCategoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spaces.defaultSize.rawValue)
        ])
    }
    
    func setupAdditionalConfiguration() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = Constants.cornerRadius
    }
}
