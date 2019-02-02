//
//  Teste_IOSTests.swift
//  Teste IOSTests
//
//  Created by Murilo de Souza Lopes on 31/01/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import XCTest
@testable import Teste_IOS

class Teste_IOSTests: XCTestCase {
    
    var moviesController: MoviesTableViewController!
    
    override func setUp() {
        super.setUp()
        moviesController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movies") as! MoviesTableViewController
        
        moviesController.preLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadMoviesNegative(){
        moviesController.loadMovies()
        XCTAssertTrue(moviesController.movies.count == 0 , "Not load Movies")
    }
    
    func testLoadMoviesNotNil(){
        moviesController.loadMovies()
        XCTAssertNotNil(moviesController.movies, "Movies is Nil")
    }
}
