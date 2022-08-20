//
//  HomeVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    private let sectionsTitles = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top rated"]
    
    private let homeFeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        let heroHeader = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = heroHeader
        configureLeftNavBar()
        configureRightNavBar()
        setNavBarTintColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configureLeftNavBar(){
        var leftBarImage = UIImage(named: "NetflixLogo")
        leftBarImage = leftBarImage?.withRenderingMode(.alwaysOriginal)
            
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarImage, style: .done, target: nil, action: nil)
      }
    
    private func configureRightNavBar(){
        let personButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: nil, action: nil)
        let playButton = UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [personButton, playButton]
    }
    private func setNavBarTintColor(){
        navigationController?.navigationBar.tintColor = .white
    }
    
  

}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitles[section]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 80
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform  = .init(translationX: 0, y: min(0, -offset))
    }
}
