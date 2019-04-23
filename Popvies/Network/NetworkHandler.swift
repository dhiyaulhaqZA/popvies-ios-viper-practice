//
//  NetworkHandler.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import Moya
import RxSwift

enum NetworkCallback<T: Codable> {
    case loading(Bool)
    case success(T)
    case failure(String, Int)
}

class NetworkHandler<T: Codable> {
    private let provider = MoyaProvider<PopviesApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func request(_ movieService: PopviesApi, callback: @escaping (NetworkCallback<T>) -> Void) {
        callback(.loading(true))
        provider.request(movieService) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                do {
                    let successResponse = try? response.filterSuccessfulStatusCodes()
                    if let successResponse = successResponse {
                        let result = try JSONDecoder().decode(T.self, from: successResponse.data)
                        callback(.success(result))
                    } else {
                        callback(.failure("Something went wrong [\(statusCode)]", statusCode))
                    }
                } catch {
                    callback(.failure("Something went wrong", statusCode))
                }

            case .failure(let error):
                callback(.failure(error.errorDescription ?? "Something went wrong", 0))
            }
            callback(.loading(false))
        }
    }
    
}
