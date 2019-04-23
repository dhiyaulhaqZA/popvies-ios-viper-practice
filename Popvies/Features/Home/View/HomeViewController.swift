//
//  HomeViewController.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 11/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {

    let popularMoviesReuseIdentifier = "popularMoviesReuseIdentifier"
    var presenter: HomeViewToPresenterProtocol?
    var movieResults: [MovieResult] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        fetchNowPlaying()
    }
    
    private func setupComponent() {
        collectionView.backgroundColor = .white
        collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: popularMoviesReuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.addSubview(refreshControl)
    }
    
    private func fetchNowPlaying() {
        presenter?.fetchNowPlaying()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchNowPlaying()
    }
    
}

