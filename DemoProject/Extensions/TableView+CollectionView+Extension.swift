//
//  TableView+CollectionView+Extension.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

extension UITableView {
    static func className() -> String {
        return "\(self)"
    }
    func registerCell(cellName: String) {
        let cellNib = UINib(nibName: cellName, bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: cellName)
    }
    func registerMultipleCell(cellNamesArray: [String]) {
        cellNamesArray.forEach { [weak self] cellName in
            let cellNib = UINib(nibName: cellName, bundle: nil)
            self?.register(cellNib, forCellReuseIdentifier: cellName)
        }
    }
}
extension UICollectionView {
    static func className() -> String {
        return "\(self)"
    }
    func registerCell(cellName: String) {
        let cellNib = UINib(nibName: cellName, bundle: nil)
        self.register(cellNib, forCellWithReuseIdentifier: cellName)
    }
    func registerMultipleCell(cellNamesArray: [String]) {
        cellNamesArray.forEach { [weak self] cellName in
            let cellNib = UINib(nibName: cellName, bundle: nil)
            self?.register(cellNib, forCellWithReuseIdentifier: cellName)
        }
    }
}
extension UITableViewCell {
    static func className() -> String {
        return "\(self)"
    }
}
extension UICollectionViewCell {
    static func className() -> String {
        return "\(self)"
    }
}
