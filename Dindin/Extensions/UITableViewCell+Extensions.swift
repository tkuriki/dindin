//
//  UITableViewCell+Extensions.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import Foundation
import UIKit

extension UITableViewCell {
    class func createCell<T: UITableViewCell>(tableView: UITableView, indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    func removeSelection() {
        selectionStyle = .none
    }
}
