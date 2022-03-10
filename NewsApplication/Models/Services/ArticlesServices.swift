//
//  ArticlesServices.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import Moya

enum ArticlesServices {
    case popular(period : Int)
}

extension ArticlesServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .popular(period: let period):
            guard let url = URL(string: UrlsForApplication.popularArticles(period: period)) else { fatalError() }
            return url
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Method {
        .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
