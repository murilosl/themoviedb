//
//  test_ListMovie.swift
//  Teste IOSTests
//
//  Created by Murilo de Souza Lopes on 02/02/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import XCTest

@testable import Teste_IOS

class test_ListMovie: XCTestCase {
    
    var moviesController: MoviesTableViewController!
    
    override func setUp() {
        super.setUp()
        
        moviesController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movies") as! MoviesTableViewController
        
        moviesController.preLoad()

    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testSearchMovie(){
        moviesController.manager.SearchMovie(text: "spider man") { (result) in
            XCTAssert((result?.count)! > 0, "not found")
            XCTAssertNotNil(result, "Movies is Nil")
        }
    }
    
}
