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
    
    func getTrendingMovies(completion:@escaping (_ error: Error?, _ trendingMovies: TrendingMoviesResponse?) -> Void) {
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
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                
               completion(nil, results)
               // print(results)
                
            } catch let error {
                
                print(error, "Catch")
               
            }
                
        }
        
    }
}
