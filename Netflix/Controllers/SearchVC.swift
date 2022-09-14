//
//  SearchVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var titles: [Title] = [Title]()
    
    let discoverTableView: UITableView = {
          let tableView = UITableView()
           tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
           return tableView
       }()
    
    private let searchController: UISearchController = {
           let controller = UISearchController(searchResultsController: SearchResultVC())
           controller.searchBar.placeholder = "Search for Movie or Tv show"
           controller.searchBar.searchBarStyle = .minimal
           return controller
       }()
       

    override func viewDidLoad() {
        super.viewDidLoad()
              discoverTableView.delegate = self
              discoverTableView.dataSource = self
        view.addSubview(discoverTableView)
        searchController.searchResultsUpdater = self
        fetchDiscoverMovies()
        
    }
    
    override func loadView() {
        super.loadView()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
       
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTableView.frame = view.bounds
    }
    
    func fetchDiscoverMovies(){
        APICaller.shared().getDiscoverMovies { [weak self] ( error, discoverMovies) in
            if let error = error {
                print(error.localizedDescription)
            } else if let discoverMovies = discoverMovies?.results {
                self!.titles = discoverMovies
                    DispatchQueue.main.async {
                        self!.discoverTableView.reloadData()
                    }
                
            }
        }
    }

}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else {
            return UITableViewCell()
        }
        
        print(titles[indexPath.row].title
        )
        cell.configure(with: titles[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
         guard let quary = searchBar.text,
        !quary.trimmed.isEmpty,
            quary.trimmed.count >= 3,
            let searchResultController = searchController.searchResultsController as? SearchResultVC else {
                return
        }
        
        APICaller.shared().search(quary: quary) { (error, searchResults) in
            if let error = error {
                print(error.localizedDescription)
            } else if let movies = searchResults?.results {
                searchResultController.movies = movies
                DispatchQueue.main.async {
                    searchResultController.searchResultCollecionView.reloadData()
                }
            }
        }
        
    }
    
    
}
