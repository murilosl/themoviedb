//
//  MovieProviderProtocol.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

protocol MovieProviderProtocol {
    func getMovies(completion: @escaping APIResultCall)
    func getMovieImage(url: String, completion: @escaping APIResultImage)
}
