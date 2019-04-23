//
//  HomePresenterProtocol.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

protocol HomeViewToPresenterProtocol: class{
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    func fetchNowPlaying()
    func showDetailViewController(navigationController: UINavigationController)
}

protocol HomePresenterToViewProtocol: class{
    func onFetchNowPlayingSuccess(movieResults: [MovieResult])
    func onFetchNowPlayingFailure(errMsg: String, statusCode: Int)
    func onFetchNowPlayingLoading(isLoading: Bool)
}

protocol HomePresenterToRouterProtocol: class {
    static func createModule()-> HomeViewController
    func pushToDetailScreen(navigationController: UINavigationController)
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchNowPlaying()
}

protocol HomeInteractorToPresenterProtocol: class {
    func onFetchNowPlayingSuccess(movieResults: [MovieResult])
    func onFetchNowPlayingFailure(errMsg: String, statusCode: Int)
    func onFetchNowPlayingLoading(isLoading: Bool)
}
