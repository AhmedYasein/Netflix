//
//  APIClaller.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/20/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation
import Alamofire

class APICaller {
    
    private static let sharedInstance = APICaller()
    
    class func shared()-> APICaller{
        return APICaller.sharedInstance
    }
    
    func getTrendingMovies(completion: @escaping (_ error: Error?, _ trendingMovies: titledMoviesResponse?) -> Void) {
        guard let trendingMoviesURL = URL(string: URLs.trendingMovies) else {
            return
        }
        let params: [String: String] = ["media_type": "all", "time_window": "day"]
        
        AF.request(trendingMoviesURL, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                // print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func getPopularMovies(completion: @escaping (_ error: Error?, _ popularMovies: titledMoviesResponse?) -> Void){
        guard let popularMoviesURL = URL(string: URLs.popularMovies) else {
            return
        }
        
        AF.request(popularMoviesURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func getUpcomingMovies(completion: @escaping (_ error: Error?, _ upcomingMoovies: titledMoviesResponse?) -> Void){
        guard let upcomingMoviesURL = URL(string: URLs.upComingMovies) else {
            return
        }
        
        AF.request(upcomingMoviesURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func getTrendingTv(completion: @escaping (_ error: Error?, _ trendingTv: titledMoviesResponse?) -> Void) {
        
        guard let trndingTvURL = URL(string: URLs.trndingTV) else {
           
            return
        }
        
        AF.request(trndingTvURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func getTopRatedMovies(completion: @escaping (_ error: Error?, _ trendingTv: titledMoviesResponse?) -> Void) {
        
        guard let topRatedURL = URL(string: URLs.topRatedMovies) else {
            return
        }
        
        AF.request(topRatedURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func getDiscoverMovies(completion: @escaping (_ error: Error?, _ upcomingMoovies: titledMoviesResponse?) -> Void){
        guard let discoverMoviesURL = URL(string: URLs.discoverMovies) else {
            return
        }
        
        AF.request(discoverMoviesURL, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch")
                
            }
            
        }
        
    }
    
    func search(quary: String, completion: @escaping (_ error: Error?, _ upcomingMoovies: titledMoviesResponse?) -> Void){
        guard let searchURL = URL(string: URLs.searchQuary) else {
            return
        }
        
        let params = ["query": quary]
        
        AF.request(searchURL, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard response.error == nil else {
                
                print(response.error)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                
                print("Did not get and data from API")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(titledMoviesResponse.self, from: data)
                
                completion(nil, results)
                //print(results)
                
            } catch let error {
                
                print(error, "Catch sds")
                
            }
            
        }
        
    }
    

    
}

