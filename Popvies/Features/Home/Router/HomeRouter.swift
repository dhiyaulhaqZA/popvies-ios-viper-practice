//
//  HomeRouter.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    
    static func createModule() -> HomeViewController {
        let layout = UICollectionViewFlowLayout()
        let view = HomeViewController(collectionViewLayout: layout)
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.title = "Now Playing"
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToDetailScreen(navigationController: UINavigationController) {
        let detail = DetailRouter.createModule()
        navigationController.pushViewController(detail, animated: true)
    }
    
}
