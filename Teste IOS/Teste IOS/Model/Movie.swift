//
//  Movie.swift
//  Teste IOS
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var title: String
    var overview : String
    var release_date: String
    var poster_path: String
}

struct MovieRoot: Codable {
    var results: [Movie]
}
