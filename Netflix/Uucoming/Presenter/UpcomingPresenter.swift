//
//  UpcomingPresenter.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/11/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation

class UpcomingPresenter {
    
    weak var view: UpComingVC!
    init(view: UpComingVC) {
        self.view = view
    }
    
    func getUpcomingMovies() -> [String]?{
        var upcomingPostersArr = [String]()
        APICaller.shared().getUpcomingMovies { (error, upcomingMovies) in
            if let error = error {
                print(error.localizedDescription)
            } else if let upcomingMovies = upcomingMovies?.results {
                for movie in upcomingMovies {
                    if let poster = movie.posterPath {
                        upcomingPostersArr.append(poster)
                    }
                }
                //return upcomingPostersArr
            }
            
        }
        return nil
    }
}
