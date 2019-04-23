//
//  DetailMovieViewController.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController, DetailPresenterToViewProtocol {

    var presenter: DetailViewToPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
