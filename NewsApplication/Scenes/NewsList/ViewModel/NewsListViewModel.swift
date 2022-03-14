//
//  NewsListViewModel.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import Foundation
import UIKit

class NewsListViewModel {
    
    private let apiService : ArticlesNetwrokProtocol
    
    var articles : [ArticleModel] = [ArticleModel]()
    
    var cellViewModels: [NewsListCellViewModel] = [NewsListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var selectedArticle: NewsDetailsViewModel?
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?

    init(API : ArticlesNetwrokProtocol = ArticlesNetwrok()) {
        self.apiService = API
    }
    func initFetch() {
        self.isLoading = true
        apiService.fetchPopularArticles(period: 7) { [weak self] (results) in
            self?.isLoading = false
            switch results {
            case .success(let data):
                self?.processFetchedArticles(articles: data.article!)
            case .failure(let error):
                self?.alertMessage = error.localizedDescription
            }
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> NewsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(article : ArticleModel) -> NewsListCellViewModel {
        
        let multimdeia = article.media![0].mediaMetadata?.filter{
            $0.format == ImageSize.standardThumbnail
        }
        let imageUrl =  multimdeia!.count > 0 ? multimdeia![0].url : ""
        return NewsListCellViewModel(titleText: article.title!, shortDescription: article.byline!, imageUrl: imageUrl!)
        
    }
    
    func processFetchedArticles(articles: [ArticleModel] ) {
        self.articles = articles
        var cellViewModels = [NewsListCellViewModel]()
        for article in articles {
            cellViewModels.append(createCellViewModel(article: article))
        }
        self.cellViewModels = cellViewModels
    }
    
}



