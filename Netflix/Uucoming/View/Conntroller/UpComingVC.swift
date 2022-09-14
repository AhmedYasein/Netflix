//
//  UpComingVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class UpComingVC: UIViewController {
    var titles: [Title] = [Title]()
    
    var upcomingPresenter: UpcomingPresenter!

    
    let upcomingTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingPresenter = UpcomingPresenter(view: self)
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
        view.addSubview(upcomingTableView)
        upcomingTableView.frame = view.bounds
        fetch()
        
    }
    
    func fetch(){
        APICaller.shared().getUpcomingMovies { [weak self] (error, upcomingMovies) in
            if let error = error {
                print(error.localizedDescription)
            } else if let upcomingMovies = upcomingMovies?.results {
                self?.titles = upcomingMovies
                DispatchQueue.main.async {
                    self?.upcomingTableView.reloadData()
                }
            }
        }
    }


}

extension UpComingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: titles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
