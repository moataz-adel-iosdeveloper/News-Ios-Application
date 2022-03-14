//
//  MockApi.swift
//  NewsApplicationTests
//
//  Created by ModyMayaAser on 13/03/2022.
//

import Foundation
@testable import NewsApplication

class MockApi : ArticlesNetwrokProtocol {
    private let mockError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "MockError"])
    private var responce : Result<ArticlesResponse, Error>!
    var isSuccess: Bool = false
    private let modelFromFile : ModelFromFile = ModelFromFile()
    
    func fetchPopularArticles(period: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> ()) {
        if isSuccess {
            let data : ArticlesResponse = modelFromFile.modelFromJSONFile(file: "content", responseType: ArticlesResponse.self)
            responce = .success(data)
        }else {
            responce = .failure((mockError))
        }
        completion(responce)
    }
    
    
}
