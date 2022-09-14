//
//  SearchResultVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/13/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController{
    
private let searchResultCollecionView: UICollectionView = {
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
