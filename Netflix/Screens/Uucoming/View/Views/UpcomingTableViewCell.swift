//
//  UpcomingTableViewCell.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/11/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {

    static let identifier = "upcomingCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle" )?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        applyConstraints()
    }
    
    func applyConstraints(){
        
      let posterConstaints = [
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                 posterImageView.widthAnchor.constraint(equalToConstant: 100)
             ]
             
             NSLayoutConstraint.activate(posterConstaints)
        
        
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: 10)
        
        
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        let playButtonConstraints = [
        playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        playButton.widthAnchor.constraint(equalToConstant: 100)
             ]
             
             NSLayoutConstraint.activate(playButtonConstraints)
        
        
          }
    
    public func configure(with title: Title){
        guard let posterURL = title.posterPath else {
            print("Not found URL")
            return
        }
        posterImageView.loadImage(image:  "https://image.tmdb.org/t/p/w500/\(posterURL)")
        titleLabel.text = title.originalTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
