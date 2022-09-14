//
//  SearchVcView.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/13/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit

class SearchVcView: UIView {
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Find a movie"
        controller.searchBar.searchBarStyle = .minimal
        controller.view.frame = CGRect(x: 100, y: 100, width: 400, height: 40)
        controller.searchBar.backgroundColor = .blue
        return controller
    }()
    
    private let ahmed: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "sDsadsadsadsad"
        label.tintColor = .black
        label.frame = CGRect(x: 90, y: 90, width: 990, height: 90)
        return label
    }()
    private lazy var loginButton: UIButton = {
           let button = UIButton()
           button.translatesAutoresizingMaskIntoConstraints = false
           button.backgroundColor = .black
        
           button.titleLabel?.textColor = .white
           button.setTitle("Login", for: .normal)
           button.layer.cornerRadius = 10
        button.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        return button
    }()
    override init(frame: CGRect) {
          super.init(frame: frame)
          addSubview(searchController.view)
        addSubview(ahmed)
      //  addSubview(loginButton)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
