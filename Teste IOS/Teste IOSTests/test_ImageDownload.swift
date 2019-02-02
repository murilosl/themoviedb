//
//  test_ImageDownload.swift
//  Teste IOSTests
//
//  Created by Murilo de Souza Lopes on 02/02/2019.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import XCTest

@testable import Teste_IOS
class test_ImageDownload: XCTestCase {
    
    let manager = MovieManager()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDownload(){
        
        let expectation = XCTestExpectation(description: "Download Image")
        
        manager.getMovieImage(poster_url: "https://image.tmdb.org/t/p/w500/aWENxGrJmXmHvifG6x2aYnpovXI.jpg") { (result) in
                XCTAssertNotNil(result, "No data was downloaded.")
                expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
}
