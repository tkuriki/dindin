//
//  ExtractLastTransactionsCell.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

final class ExtractLastTransactionsCell: UITableViewCell {
    // MARK: - Properties
    private var lastTransactions: [Transaction] = []
    
    private lazy var transactionsTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Últimas transações"
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()
    
    // MARK: - Override Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        registerCells()
        removeSelection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func fill(with lastTransactions: [Transaction]) {
        self.lastTransactions = lastTransactions
        self.reloadCollectionView()
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func registerCells() {
        collectionView.register(ExtractLastTransactionCell.self, forCellWithReuseIdentifier: String(describing: ExtractLastTransactionCell.self))
    }
    
    private func createTransactionCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> ExtractLastTransactionCell {
        let cell: ExtractLastTransactionCell = ExtractLastTransactionCell.createCell(collectionView: collectionView, cellForItemAt: indexPath)
        cell.fill(with: lastTransactions[indexPath.item])
        return cell
    }
}

// MARK: - ViewCode Protocol
extension ExtractLastTransactionsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lastTransactions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createTransactionCell(collectionView, cellForItemAt: indexPath)
    }
}

extension ExtractLastTransactionsCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(transactionsTitleLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        let collectionViewHeight: CGFloat = 120
        
        NSLayoutConstraint.activate([
            transactionsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spaces.extraLargeSize.rawValue),
            transactionsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spaces.defaultSize.rawValue),
            transactionsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            
            collectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            collectionView.topAnchor.constraint(equalTo: transactionsTitleLabel.bottomAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            collectionView.trailingAnchor.constraint(equalTo: transactionsTitleLabel.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: transactionsTitleLabel.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spaces.defaultSize.rawValue)
        ])
    }
}
