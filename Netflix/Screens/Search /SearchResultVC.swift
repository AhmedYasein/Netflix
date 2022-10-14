//
//  SearchResultVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/13/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

protocol SearchResultVCDelegate: class {
    func didTapItem(_ model: MoviePreviewModel)
}
class SearchResultVC: UIViewController{
    
    public var movies: [Title] = [Title]()
    
    public weak var delegate: SearchResultVCDelegate?
    
    public let searchResultCollecionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200 )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchResultCollecionView)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollecionView.frame = view.bounds
        searchResultCollecionView.delegate = self
        searchResultCollecionView.dataSource = self
        
    }
}

extension SearchResultVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(poster: movies[indexPath.row].posterPath  ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let movie = movies[indexPath.row]
        
        guard  let titleName = movie.originalName ?? movie.originalTitle else {
            return
        }
        APICaller.shared().getMoviesFromYoutube(quary: titleName) {[weak self] (error, videoElement) in
            if let error = error {
                print(error.localizedDescription)
            } else if let videoElement = videoElement {
                self?.delegate?.didTapItem(MoviePreviewModel(title: titleName, youtubeVideo: videoElement, overview: movie.overview ?? ""))

                
            }
        }
        
        
    }
    
    
}
