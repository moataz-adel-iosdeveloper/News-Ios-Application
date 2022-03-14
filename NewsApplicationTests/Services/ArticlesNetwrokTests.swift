//
//  ArticlesNetwrokTests.swift
//  NewsApplicationTests
//
//  Created by ModyMayaAser on 09/03/2022.
//

import XCTest
@testable import NewsApplication
import Moya

class ArticlesNetwrokTests: XCTestCase {

    var sut : ArticlesNetwrok!
    override func setUp() {
        super.setUp()
        sut = ArticlesNetwrok()
    }

    func testFetchPopularArticles() {
        
        // Given A api service
        let sut = self.sut!
        // When fetch top stories
        let expectation = XCTestExpectation(description: "callback")
        var errorResponse : Error?
        var articlesResponse : ArticlesResponse?
        
        sut.fetchPopularArticles(period: 7) { (result) in
            expectation.fulfill()
            switch result {
            case .success(let data):
                articlesResponse = data
            case .failure(let error):
                errorResponse = error
            }
        }
        wait(for: [expectation], timeout: 4)
        XCTAssertNil(errorResponse)
        XCTAssertNotNil(articlesResponse)
    }
    
    func testFetchPopularArticles_BackEndNot200() {
        
        // Given A api service
        let sut = self.sut!
        // When fetch top stories
        let expectation = XCTestExpectation(description: "callback")
        var errorResponse : Error?
        var articlesResponse : ArticlesResponse?

        sut.fetchPopularArticles(period: 15) { (result) in
            expectation.fulfill()
            switch result {
            case .success(let data):
                articlesResponse = data
            case .failure(let error):
                errorResponse = error
            }
        }
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(errorResponse)
        XCTAssertNil(articlesResponse)
        XCTAssertNotEqual(errorResponse?.localizedDescription, "")
    }

    override func tearDownWithError() throws {
        sut = nil
    }


}
