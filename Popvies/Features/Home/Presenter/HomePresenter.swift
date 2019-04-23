//
//  HomePresenter.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    
    func fetchNowPlaying() {
        interactor?.fetchNowPlaying()
    }
    
    func showDetailViewController(navigationController: UINavigationController) {
        router?.pushToDetailScreen(navigationController: navigationController)
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func onFetchNowPlayingSuccess(movieResults: [MovieResult]) {
        view?.onFetchNowPlayingSuccess(movieResults: movieResults)
    }
    
    func onFetchNowPlayingFailure(errMsg: String, statusCode: Int) {
        view?.onFetchNowPlayingFailure(errMsg: errMsg, statusCode: statusCode)
    }
    
    func onFetchNowPlayingLoading(isLoading: Bool) {
        view?.onFetchNowPlayingLoading(isLoading: isLoading)
    }
    
}
