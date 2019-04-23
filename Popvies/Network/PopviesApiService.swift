//
//  PopviesApiService.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import Moya 

enum PopviesApi {
    case nowPlaying
}

extension PopviesApi: TargetType {
    var baseURL: URL {
        return Config.baseUrl!
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .nowPlaying:
            return .requestParameters(parameters: ["api_key": Config.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
}
