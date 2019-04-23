//
//  PopularMovieCell.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 12/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

class PopularMovieCell: UICollectionViewCell {
    
    let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.dropShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imagePoster: ImageLoader = {
        let image = ImageLoader()
        image.backgroundColor = R.color.colorNoImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = R.color.colorBlack()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewContainerRating: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.colorWhiteTransparent()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageRating: UIImageView = {
        let image = UIImageView()
        image.image = R.image.icStarFull()?.changeImageColor(R.color.colorRating())
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let labelRating: UILabel = {
        let label = UILabel()
        label.textColor = R.color.colorBlack()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewContainerRating.roundCorners([.bottomRight], radius: 16)
    }
    
    private func setupUI() {
        addSubview(viewContainer)
        viewContainer.addSubview(imagePoster)
        viewContainer.addSubview(labelTitle)
        viewContainer.addSubview(viewContainerRating)
        viewContainerRating.addSubview(imageRating)
        viewContainerRating.addSubview(labelRating)
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            viewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            ])
        
        NSLayoutConstraint.activate([
            imagePoster.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 0),
            imagePoster.heightAnchor.constraint(equalToConstant: 284),
            imagePoster.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 0),
            imagePoster.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 8),
            labelTitle.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -8),
            labelTitle.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 8),
            labelTitle.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -8)
            ])
        
        NSLayoutConstraint.activate([
            viewContainerRating.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            viewContainerRating.bottomAnchor.constraint(equalTo: imageRating.bottomAnchor, constant: 8),
            viewContainerRating.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            viewContainerRating.trailingAnchor.constraint(equalTo: labelRating.trailingAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            imageRating.topAnchor.constraint(equalTo: viewContainerRating.topAnchor, constant: 8),
            imageRating.heightAnchor.constraint(equalToConstant: 20),
            imageRating.widthAnchor.constraint(equalToConstant: 20),
            imageRating.leadingAnchor.constraint(equalTo: viewContainerRating.leadingAnchor, constant: 8)
            ])

        NSLayoutConstraint.activate([
            labelRating.topAnchor.constraint(equalTo: viewContainerRating.topAnchor, constant: 8),
            labelRating.heightAnchor.constraint(equalToConstant: 20),
            labelRating.leadingAnchor.constraint(equalTo: imageRating.trailingAnchor, constant: 8),
            ])
    }
    
    func setData(movie: MovieResult) {
        labelTitle.text = movie.title
        let voteAverage = String(format:"%.1f", movie.voteAverage ?? 0.0)
        labelRating.text = voteAverage
        
        if let posterPath = movie.posterPath {
            let urlImage = Config.imageBaseUrl + posterPath
            imagePoster.loadImageUsingUrlString(urlImage, completion: {_ in })
        }
    }

}
