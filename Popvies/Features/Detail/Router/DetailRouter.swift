//
//  DetailRouter.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    
    static func createModule() -> DetailMovieViewController {
        let view = DetailMovieViewController()
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let router: DetailPresenterToRouterProtocol = DetailRouter()
        
        view.title = "Detail"
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
