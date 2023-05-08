//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 08/05/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}