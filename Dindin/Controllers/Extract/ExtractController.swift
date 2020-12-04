//
//  ExtractController.swift
//  Dindin
//
//  Created by Thiago Kuriki on 02/12/20.
//

import UIKit

protocol ExtractControllerDisplay: class {
    func shouldReloadData()
}

final class ExtractController: UITableViewController {
    // MARK: - Properties
    private lazy var presenter: ExtractPresenter = ExtractPresenter(viewController: self)
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupTableView()
        registerCells()
    }
    
    // MARK: - Private Methods
    private func setupController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor(named: Constants.Colors.primary.rawValue)
        title = "Extrato"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
    }
    
    private func registerCells() {
        tableView.register(ExtractBalanceCell.self, forCellReuseIdentifier: String(describing: ExtractBalanceCell.self))
        tableView.register(ExtractLastTransactionsCell.self, forCellReuseIdentifier: String(describing: ExtractLastTransactionsCell.self))
        tableView.register(ExtractTransactionsCell.self, forCellReuseIdentifier: String(describing: ExtractTransactionsCell.self))
    }
    
    // MARK: - Cell Creation Methods
    private func createLastTransactionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ExtractLastTransactionsCell {
        let cell: ExtractLastTransactionsCell = ExtractLastTransactionsCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(with: presenter.getLastTransactions())
        return cell
    }
    
    private func createTransactionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ExtractTransactionsCell {
        let cell: ExtractTransactionsCell = ExtractTransactionsCell.createCell(tableView: tableView, indexPath: indexPath)
        cell.fill(with: presenter.getTransactions())
        return cell
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource
extension ExtractController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = presenter.getCellType(atIndexPath: indexPath)
        
        switch cellType {
        case .balance:
            return ExtractBalanceCell(frame: .zero)
        case .lastTransactions:
            return createLastTransactionsCell(tableView, cellForRowAt: indexPath)
        case .transactions:
            return createTransactionsCell(tableView, cellForRowAt: indexPath)
        }
    }
}

// MARK: - ExtractControllerDisplay
extension ExtractController: ExtractControllerDisplay {
    func shouldReloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
