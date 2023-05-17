//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 14/05/2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    static let identifier = "TitleCollectionViewCell"
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Calss Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
        
    }
}
