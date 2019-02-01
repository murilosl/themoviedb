//
//  MovieProvider.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation
import Alamofire

class MovieProvider: MovieProviderProtocol{
    
    let api = API()
    
    //MARK: Get Movies
    func getMovies(completion: @escaping APIResultCall) {
        
        let parameters: Parameters = [
            "api_key" : API_KEY,
            "sort_by" : "popularity.desc"
        ]
        
        api.open(url: URL_TOP, parameters: parameters) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
        
    }
    
    //MARK: Get Movie Image
    func getMovieImage(url: String, completion: @escaping APIResultImage) {
        api.getImageFromUrl(url: url) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: Search Movie
    func SearchMovie(text: String, completion: @escaping APIResultCall) {
        
        let parametersSearch: Parameters = [
            "api_key" : API_KEY,
            "query" : text
        ]
        
        api.open(url: URL_SEARCH, parameters: parametersSearch) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
        
    }
    
}
