//
//  ArticlesNetwrok.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import Foundation
import Moya
import UIKit

struct ArticlesNetwrok {
    
    private let provider = MoyaProvider<ArticlesServices>()

    func fetchPopularArticles<T: Decodable>(period: Int,responseClass: T.Type,completion: @escaping (Result<T, Error>) -> () ) {
        self.provider.request(.popular(period: period)) { result in
          switch result {
          case .success(let response):
              switch response.statusCode {
              case 200:
                  do {
                      let results = try JSONDecoder().decode(T.self, from: response.data)
                      completion(.success(results))
                  } catch let error {
                      completion(.failure(error))
                  }
              default:
                  do {
                      let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                      let error = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.fault.faultstring])
                      completion(.failure(error))
                  } catch let error {
                      completion(.failure(error))
                  }
              }
          case .failure(let error):
              completion(.failure(error))
          }
        }
    }
}
