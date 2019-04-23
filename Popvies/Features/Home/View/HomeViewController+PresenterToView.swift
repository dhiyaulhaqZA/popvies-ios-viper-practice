//
//  HomeViewController+PresenterToView.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 13/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

extension HomeViewController: HomePresenterToViewProtocol {
    
    func onFetchNowPlayingSuccess(movieResults: [MovieResult]) {
        self.movieResults = movieResults
        collectionView.reloadData()
        print("DBG success")
    }
    
    func onFetchNowPlayingFailure(errMsg: String, statusCode: Int) {
        toastMessage(errMsg)
    }
    
    func onFetchNowPlayingLoading(isLoading: Bool) {
        print("DBG loading")
        isLoading ? refreshControl.beginRefreshing() : refreshControl.endRefreshing()
    }
    
}
