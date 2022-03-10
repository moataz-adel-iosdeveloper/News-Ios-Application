//
//  NewsListViewModel.swift
//  NewsApplicationTests
//
//  Created by ModyMayaAser on 10/03/2022.
//

import XCTest
@testable import NewsApplication

class NewsListViewModelTests: XCTestCase {

    var sut : NewsListViewModel?
    override func setUpWithError() throws {
        sut = NewsListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }


}
