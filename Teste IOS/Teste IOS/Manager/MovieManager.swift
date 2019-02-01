//
//  MovieManager.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

class MovieManager{

    //MARK: Proprieties
    let business = MovieBusiness()
    
    //MARK: GetMovies
    func getMovies(completion: @escaping ResultMovies){
        business.getMovies { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: Search Movie
    func SearchMovie(text: String, completion: @escaping ResultMovies) {
        
        business.SearchMovie(text: text) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: Get Image Movie
    func getMovieImage(poster_url: String, completion: @escaping APIResultImage) {
        business.getMovieImage(poster_url: poster_url) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
}
