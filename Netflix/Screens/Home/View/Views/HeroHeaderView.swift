//
//  HeroHeaderView.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/20/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let heroImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //imageView.image = UIImage(named: "Daredevil")
        return imageView
    }()
    
    private let playButton: UIButton = {
          let button = UIButton()
           button.setTitle("Play", for: .normal)
           button.layer.borderColor = UIColor.white.cgColor
           button.layer.borderWidth = 1
           button.translatesAutoresizingMaskIntoConstraints = false
           button.layer.cornerRadius = 5
           return button
       }()
    private let downloadButton: UIButton = {
             let button = UIButton()
              button.setTitle("Download", for: .normal)
              button.layer.borderColor = UIColor.white.cgColor
              button.layer.borderWidth = 1
              button.translatesAutoresizingMaskIntoConstraints = false
              button.layer.cornerRadius = 5

              return button
          }()
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyPalyButtonConstraints()
        applyDownloadButtonConstraints()

    }
    override func layoutSubviews() {
        heroImageView.frame = self.bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    func configure(model: Title){
        heroImageView.loadImage(image: "https://image.tmdb.org/t/p/w500/\(model.posterPath ?? "any URL")")
    }
    private func addGradient(){
          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [
              UIColor.clear.cgColor,
              UIColor.systemBackground.cgColor
          ]
          gradientLayer.frame = self.bounds
          layer.addSublayer(gradientLayer)
      } 
    
  
    
    private func applyPalyButtonConstraints(){
          let playButtonConstaints = [
              playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
              playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
              playButton.widthAnchor.constraint(equalToConstant: 100)
          ]
          
          NSLayoutConstraint.activate(playButtonConstaints)
      }
    
    private func applyDownloadButtonConstraints(){
        let downloadButtonConstaints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstaints)
    }
}

//
