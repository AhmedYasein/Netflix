//
//  CollectionViewTableViewCell.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: class {
    func didTapedCell(_ cell: CollectionViewTableViewCell, viewModel: MoviePreviewModel)
}

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    private var titles: [Title] = [Title]()

    
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
    }
    public func configure(titles: [Title]){
        self.titles = titles
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    
    
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let poster = titles[indexPath.row].posterPath else {return UICollectionViewCell()}
        cell.configureCell(poster: poster)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = titles[indexPath.row].originalTitle ?? titles[indexPath.row].title ??  titles[indexPath.row].originalName ?? "unKnown"
       print(title)
        
        APICaller.shared().getMoviesFromYoutube(quary: title + " trailer") { [weak self](error, movie) in
            if let error = error {
                print(error.localizedDescription)
            } else if let videoElement = movie {
                let title = self?.titles[indexPath.row]
                guard let titleOverview = title?.overview else {
                    return
                }
                let model = MoviePreviewModel(title: title?.originalName ?? title?.originalTitle ?? "Unknown", youtubeVideo: videoElement , overview: titleOverview)
                
                guard let strongSelf = self else {
                    return
                }
                
                self?.delegate?.didTapedCell(strongSelf, viewModel: model)
                
        }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
           
           let config = UIContextMenuConfiguration(
               identifier: nil,
               previewProvider: nil) {[weak self] _ in
                let downloadAction = UIAction(title: "Download", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                    print("Downloaded")
                }
                return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [downloadAction])
               }
           
           return config
       }
}
