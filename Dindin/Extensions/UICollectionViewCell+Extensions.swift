//
//  UICollectionViewCell+Extensions.swift
//  Dindin
//
//  Created by Thiago Kuriki on 03/12/20.
//

import UIKit

extension UICollectionViewCell {
    static func createCell<T: UICollectionViewCell>(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> T {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}

