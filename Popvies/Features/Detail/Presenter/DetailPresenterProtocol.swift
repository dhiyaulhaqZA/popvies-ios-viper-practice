//
//  DetailPresenterProtocol.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

protocol DetailViewToPresenterProtocol: class{
    var view: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    
}

protocol DetailPresenterToViewProtocol: class{
}

protocol DetailPresenterToRouterProtocol: class {
    static func createModule()-> DetailMovieViewController
    
}

protocol DetailPresenterToInteractorProtocol: class {
    var presenter: DetailInteractorToPresenterProtocol? {get set}
}

protocol DetailInteractorToPresenterProtocol: class {
}
