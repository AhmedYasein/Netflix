//
//  HomeVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit
import Alamofire
class HomeVC: UIViewController {
    
    
    
    enum sections: Int {
        case trendingMovies = 0
        case trendingTv
        case popular
        case upcoming
        case topRated
        
    }
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
        navigationController?.hidesBarsOnSwipe = true
        
        
        
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
        switch indexPath.section {
        case sections.trendingMovies.rawValue:
            APICaller.shared().getTrendingMovies { (error, moviesResponse)  in
                       if let error = error {
                           print(error.localizedDescription)
                       } else if let  movies = moviesResponse?.results {
                        var postersArr = [String]()
                           
                           for movie in movies {
                               if let poster = movie.posterPath {
                                postersArr.append(poster)
                                   

                                   
                               }
                           }
                        cell.configure(titles: postersArr)
                       }

                   }
            
        case sections.trendingTv.rawValue:
              APICaller.shared().getTrendingTv { (error, trendingTv) in
                      if let error = error {
                          print(error.localizedDescription)
                      } else if let trendingTv = trendingTv?.results {
                          var postersArr = [String]()
                          for trendingTv in trendingTv {
                              guard let poster = trendingTv.posterPath else {
                                  return
                              }
                              postersArr.append(poster)
                          }
                          cell.configure(titles: postersArr)
                      }
                  }
            
        case sections.popular.rawValue:
            APICaller.shared().getPopularMovies{( error, popularMovies)
                       in
                       if let error = error {
                           print(error.localizedDescription)
                       } else if let popularMovies = popularMovies?.results {
                        var postersArr = [String]()
                           for popularMovie in popularMovies {
                               if let poster = popularMovie.posterPath {
                                   postersArr.append(poster)
                               }
                           }
                        cell.configure(titles: postersArr)

                       }
                   }
            
        case sections.upcoming.rawValue:
            APICaller.shared().getUpcomingMovies { (error, upcomingMovies) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let upcomingMovies = upcomingMovies?.results {
                    var postersArr = [String]()
                    for upcomingMovie in upcomingMovies {
                        guard let poster = upcomingMovie.posterPath else {return}
                        postersArr.append(poster)
                    }
                    cell.configure(titles: postersArr)

                }
            }
            
        case sections.topRated.rawValue:
            APICaller.shared().getTopRatedMovies { (error, topRatedMovies) in
                     if let error = error {
                         print(error.localizedDescription)
                     } else if let topRatedMovies = topRatedMovies?.results {
                         var postersArr  = [String]()
                         for topRatedMovie in topRatedMovies {
                             guard let poster = topRatedMovie.posterPath else {
                                 return
                             }
                             postersArr.append(poster)
                         }
                          cell.configure(titles: postersArr)
                     }
                 }
        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
