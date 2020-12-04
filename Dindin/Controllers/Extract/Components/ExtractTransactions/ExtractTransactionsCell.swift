//
//  ExtractTransactionsCell.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

final class ExtractTransactionsCell: UITableViewCell {
    // MARK: - Properties
    private var transactions: [Transaction] = []
    
    // MARK: - UI Components
    private lazy var transactionsTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Suas transações"
        label.font = UIFont.systemFont(ofSize: Constants.Fonts.defaultSize.rawValue, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        
        return tableView
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
    public func fill(with transactions: [Transaction]) {
        self.transactions = transactions
        self.reloadTableView()
    }
    
    // MARK: - Private Methods
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func registerCells() {
        tableView.register(ExtractTransactionCell.self, forCellReuseIdentifier: String(describing: ExtractTransactionCell.self))
    }
    
    private func createTransactionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ExtractTransactionCell {
        let cell: ExtractTransactionCell = ExtractTransactionCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(with: transactions[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource
extension ExtractTransactionsCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createTransactionCell(tableView, cellForRowAt: indexPath)
    }
}

// MARK: - ViewCode Protocol
extension ExtractTransactionsCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(transactionsTitleLabel)
        contentView.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transactionsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spaces.extraLargeSize.rawValue),
            transactionsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spaces.defaultSize.rawValue),
            transactionsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            
            tableView.heightAnchor.constraint(equalToConstant: 500),
            tableView.topAnchor.constraint(equalTo: transactionsTitleLabel.bottomAnchor, constant: Constants.Spaces.defaultSize.rawValue),
            tableView.trailingAnchor.constraint(equalTo: transactionsTitleLabel.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: transactionsTitleLabel.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spaces.defaultSize.rawValue)
        ])
    }
}
