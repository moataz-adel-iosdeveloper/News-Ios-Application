//
//  NewsListViewModel+SelectedArtical.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 09/03/2022.
//

import Foundation

extension NewsListViewModel {
    func SelectedArticle(at indexPath: IndexPath){
        let article = self.articles[indexPath.row]
        let multimdeia = article.media?[0].mediaMetadata?.filter{
            $0.format! == ImageSize.mediumThreeByTwo440
        }
        let imageUrl =  (multimdeia?.count)! > 0 ? multimdeia![0].url : ""
        var dateString = ""
        if (article.publishedDate != nil){
            let dateArray = article.publishedDate?.components(separatedBy: "T")
            dateString = dateArray!.count > 0 ? dateArray![0]  : ""
        }
        self.selectedArticle = NewsDetailsViewModel(titleText: article.title!, authorText: article.byline!, imageUrl: imageUrl!, dateText: dateString, detailsText: article.abstract!, subSection: article.subsection!)
    }
}
