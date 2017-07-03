//
//  APIManager.swift
//  MySwiftyJson
//
//  Created by ahmed on 6/3/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    class func loadMovies(completion : @escaping (_ error : Error?, _ movies : [Movie]?) -> Void) {
        
        let url = "http://api.androidhive.info/json/movies.json"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    completion(error, nil)
                    print(error)
                
                case .success(let value):
                    let json = JSON(value)
                    
                    guard let dataArr = json.array else{
                        completion(nil, nil)
                        return
                    }
                    var movies = [Movie]()
                    for data in dataArr {
                        if let data = data.dictionary, let movie = Movie.init(dict: data) {
                            movies.append(movie)
                        }
//                        guard let data = data.dictionary else {return}
//                        let movie = Movie()
//                        movie.title = data["title"]?.string ?? ""
//                        movie.image = data["image"]?.string ?? ""
//                        movie.rating = data["rating"]?.double ?? 0.0
//                        movies.append(movie)
                        //or optional binding that make initialization if condition false
//                        if let title = data["title"]?.string, let image = data["image"]?.string, let rating = data["rating"]?.double {
//                            let movie = Movie()
//                            movie.title = title
//                            movie.image = image
//                            movie.rating = rating
//                            movies.append(movie)
//                        }
                    }
                    completion(nil, movies)
                }
                
        }
    }
}
