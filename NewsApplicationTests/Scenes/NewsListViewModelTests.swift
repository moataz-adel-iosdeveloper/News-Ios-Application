//
//  NewsListViewModel.swift
//  NewsApplicationTests
//
//  Created by ModyMayaAser on 10/03/2022.
//

import XCTest
@testable import NewsApplication

class NewsListViewModelTests: XCTestCase {

    var sut : NewsListViewModel!
    var mockApiServices : MockApi!
    override func setUp() {
        mockApiServices = MockApi()
        sut = .init(API: mockApiServices)
    }

    override func tearDown() {
        sut = nil
        mockApiServices = nil
    }

    func testFetchArticlesFailure() {
        
        sut.showAlertClosure = { [weak self] () in
            if let message = self?.sut.alertMessage {
                XCTAssertNotEqual(message, "")
            }
        }
        callApiServices(with: false)
        
    }
    
    func testFetchArticlesSuccess() {
        sut.reloadTableViewClosure = { [weak self] () in
            XCTAssertEqual(self?.sut.cellViewModels.count, self?.sut.articles.count)
        }
        callApiServices(with: true)
        
    }
    func testGetCellViewModel() {
        callApiServices(with: true)
        for (index,_) in sut.cellViewModels.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let cellVM = sut.getCellViewModel(at: indexPath)
            let indexArticle : ArticleModel = sut.articles[index]
            
            //Assert
            XCTAssertNotNil(cellVM)
            XCTAssertEqual( cellVM.titleText, indexArticle.title)
            XCTAssertEqual( cellVM.shortDescription, indexArticle.byline)
        }
    }

}
extension NewsListViewModelTests {
    func callApiServices(with isApiSuccess :Bool) {
        mockApiServices.isSuccess = isApiSuccess
        // Get Mock Data
        mockApiServices.fetchPopularArticles(period: 7) { [weak self] (responce) in
            switch responce {
            case .success(let data):
                self!.sut?.processFetchedArticles(articles: data.article!)
            case .failure(let error):
                self!.sut?.alertMessage = error.localizedDescription
            }
        }
    }
}
