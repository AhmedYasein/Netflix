//
//  ViewController.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {

    let homeVC = UINavigationController(rootViewController: HomeVC())
    let upComingVC = UINavigationController(rootViewController: UpComingVC())
    let searchVC = UINavigationController(rootViewController: SearchVC())
    let downloadsVC = UINavigationController(rootViewController: DownloadsVC())
    
    
  //  let tabBarVCs: [UIViewController] = [self.homeVC, self.upComingVC, self.searchVC, self.downloadsVC]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.backgroundColor = .none
        tabBar.tintColor = .label
        setTabBarVCs()
        SetTabBarImages()
        setTabBarItmesTitles()
        
    }
    func setTabBarVCs(){
              
               setViewControllers([homeVC, upComingVC, searchVC, downloadsVC], animated: true)
    }
    func SetTabBarImages(){
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upComingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

    }
    func setTabBarItmesTitles(){
        homeVC.title = "Home"
        searchVC.title = "Search"
        upComingVC.title = "Coming Soon"
        downloadsVC.title = "Downloads"
    }
   
}

