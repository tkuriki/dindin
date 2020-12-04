//
//  ExtractPresenter.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import Foundation
import UIKit

enum ExtractCellTypes {
    case balance
    case lastTransactions
    case transactions
    
    var cellHeight: CGFloat {
        switch self {
        case .transactions:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}

final class ExtractPresenter {
    // MARK: - Properties
    private let cellTypes: [ExtractCellTypes] = [.balance, .lastTransactions, .transactions]
    private var extract: Transactions = Transactions()
    private weak var viewController: ExtractControllerDisplay?
    
    // MARK: - Initializer Methods
    init(viewController: ExtractControllerDisplay?) {
        self.viewController = viewController
        self.loadTransactions()
    }
    
    // MARK: - Public Methods
    public func numberOfItems(inSection section: Int) -> Int {
        return cellTypes.count
    }
    
    public func getCellType(atIndexPath indexPath: IndexPath) -> ExtractCellTypes {
        return cellTypes[indexPath.row]
    }
    
    public func getTransactions() -> [Transaction] {
        return extract.transactions
    }
    
    public func getLastTransactions(with count: Int = 5) -> [Transaction] {
        return extract.transactions.suffix(count)
    }
    
    // MARK: - Private Methods
    private func loadTransactions() {
        guard let url = Bundle.main.url(forResource: "transactions", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            extract = try decoder.decode(Transactions.self, from: data)
            viewController?.shouldReloadData()
        } catch {
            print("It wasn't possible to retrive the transactions")
        }
    }
}


