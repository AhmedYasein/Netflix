//
//  TitleCollectionViewCell.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/3/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit 


class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configureCell(poster: String){
        posterImageView.loadImage(image: "https://image.tmdb.org/t/p/w500/\(poster)")
    }
}
