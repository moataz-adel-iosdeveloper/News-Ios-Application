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
        let expectation = XCTestExpectation(description: "Get Data Done Succeed")
        var errorResponse : Error?
        var articlesResponse : ArticlesResponse?
        
        sut.fetchPopularArticles(period: 7, responseClass: ArticlesResponse.self) { (result) in
            switch result {
            case .success(let data):
                articlesResponse = data
            case .failure(let error):
                errorResponse = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(errorResponse)
        XCTAssertNotNil(articlesResponse)
    }
    
    func testFetchPopularArticles_BackEndNot200() {
        let expectation = XCTestExpectation(description: "Get Data Done Succeed")
        var errorResponse : Error?
        var articlesResponse : ArticlesResponse?

        sut.fetchPopularArticles(period: 15, responseClass: ArticlesResponse.self) { (result) in
            switch result {
            case .success(let data):
                articlesResponse = data
            case .failure(let error):
                errorResponse = error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(errorResponse)
        XCTAssertNil(articlesResponse)
        XCTAssertNotEqual(errorResponse?.localizedDescription, "")
    }

    override func tearDownWithError() throws {
        sut = nil
    }


}
