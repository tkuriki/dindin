//
//  ExtractBalanceCell.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

final class ExtractBalanceCell: UITableViewCell {
    private lazy var balanceTitle: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Saldo"
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.smallSize.rawValue, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var balanceValue: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.extraLargeSize.rawValue, weight: .bold)
        label.text = "R$ 3.234,00"
        label.textColor = .white
        
        return label
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
}

// MARK: - ViewCode Protocol
extension ExtractBalanceCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(balanceTitle)
        contentView.addSubview(balanceValue)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spaces.extraLargeSize.rawValue),
            balanceTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spaces.defaultSize.rawValue),
            balanceTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            
            balanceValue.topAnchor.constraint(equalTo: balanceTitle.bottomAnchor, constant: Constants.Spaces.smallSize.rawValue),
            balanceValue.trailingAnchor.constraint(equalTo: balanceTitle.trailingAnchor),
            balanceValue.leadingAnchor.constraint(equalTo: balanceTitle.leadingAnchor),
            balanceValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spaces.extraLargeSize.rawValue)
        ])
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = UIColor(named: Constants.Colors.secondary.rawValue)
    }
}
