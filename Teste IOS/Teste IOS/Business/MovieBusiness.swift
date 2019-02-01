//
//  MovieBusiness.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

class MovieBusiness{
    
    //MARK: Proprieties
    let provider =  MovieProvider()
    
    //MARK: Get Movies
    func getMovies(completion: @escaping ResultMovies){
        
        provider.getMovies { (result) in
            if result != nil{
                let json = JSONDecoder()
                do{
                    let dataReturn = try json.decode(MovieRoot.self, from: result!)
                    
                    let movies = dataReturn.results
                    completion(movies)
                }catch{
                    completion(nil)
                }
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: Search Movie
    func SearchMovie(text: String, completion: @escaping ResultMovies) {
        
        provider.SearchMovie(text: text) { (result) in
            if result != nil{
                let json = JSONDecoder()
                do{
                    let dataReturn = try json.decode(MovieRoot.self, from: result!)
                    
                    let movies = dataReturn.results
                    completion(movies)
                }catch{
                    completion(nil)
                }
            }else{
                completion(nil)
            }
        }
    }
    
    //MARK: Get Image Movie
    func getMovieImage(poster_url: String, completion: @escaping APIResultImage) {
        
        let imageUrlString = PATH_IMAGE + poster_url
        
        provider.getMovieImage(url: imageUrlString) { (result) in
            if result != nil{
                completion(result)
            }else{
                completion(nil)
            }
        }
    }
    
}
