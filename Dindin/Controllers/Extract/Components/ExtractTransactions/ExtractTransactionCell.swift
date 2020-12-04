//
//  ExtractTransactionCell.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

final class ExtractTransactionCell: UITableViewCell {
    // MARK: - UI Components
    private lazy var transactionTypeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.smallSize.rawValue, weight: .thin)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var transactionCategoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var transactionDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var transactionValueLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue, weight: .semibold)
        label.textColor = UIColor(named: Constants.Colors.primary.rawValue)
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Override Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        removeSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func fill(with transaction: Transaction) {
        transactionTypeLabel.text = transaction.type.description
        transactionCategoryLabel.text = transaction.category.rawValue
        transactionDateLabel.text = transaction.date
        transactionValueLabel.text = transaction.value
    }
}

// MARK: - ViewCode Protocol
extension ExtractTransactionCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(transactionTypeLabel)
        contentView.addSubview(transactionCategoryLabel)
        contentView.addSubview(transactionDateLabel)
        contentView.addSubview(transactionValueLabel)
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        let separatorViewHeight: CGFloat = 1
        
        NSLayoutConstraint.activate([
            transactionTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spaces.smallSize.rawValue),
            transactionTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            transactionTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            transactionCategoryLabel.topAnchor.constraint(equalTo: transactionTypeLabel.bottomAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            transactionCategoryLabel.trailingAnchor.constraint(equalTo: transactionTypeLabel.trailingAnchor),
            transactionCategoryLabel.leadingAnchor.constraint(equalTo: transactionTypeLabel.leadingAnchor),
            
            transactionDateLabel.topAnchor.constraint(equalTo: transactionCategoryLabel.bottomAnchor, constant: Constants.Spaces.smallSize.rawValue),
            transactionDateLabel.trailingAnchor.constraint(equalTo: transactionCategoryLabel.trailingAnchor),
            transactionDateLabel.leadingAnchor.constraint(equalTo: transactionCategoryLabel.leadingAnchor),
            
            transactionValueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            transactionValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spaces.defaultSize.rawValue),
            
            separatorView.heightAnchor.constraint(equalToConstant: separatorViewHeight),
            separatorView.topAnchor.constraint(equalTo: transactionDateLabel.bottomAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            separatorView.trailingAnchor.constraint(equalTo: transactionDateLabel.trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: transactionDateLabel.leadingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spaces.smallSize.rawValue)
        ])
    }
    
    func setupAdditionalConfiguration() {
        separatorView.backgroundColor = .lightGray
    }
}
