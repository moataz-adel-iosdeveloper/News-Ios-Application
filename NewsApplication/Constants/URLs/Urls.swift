//
//  Urls.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import Foundation

struct UrlsForApplication {
    
    static func popularArticles(period : Int) -> String{
        return "\(DomainUrl.mainDomain)/svc/mostpopular/v2/viewed/\(period).json?api-key=\(DomainUrl.appKey)"
    }
    
}
