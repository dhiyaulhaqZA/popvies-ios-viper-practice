//
//  HomeInteractor.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

class HomeInteractor: HomePresenterToInteractorProtocol{
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    
    func fetchNowPlaying() {
        let networkHandler = NetworkHandler<MovieResponse>()
        networkHandler.request(.nowPlaying) { (callback) in
            switch callback {
            case .loading(let isLoading):
                self.presenter?.onFetchNowPlayingLoading(isLoading: isLoading)
            case .success(let response):
                self.presenter?.onFetchNowPlayingSuccess(movieResults: response.results ?? [])
            case .failure(let errMsg, let statusCode):
                self.presenter?.onFetchNowPlayingFailure(errMsg: errMsg, statusCode: statusCode)
            }
        }
    }
}
