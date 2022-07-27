//
//  MovieDetailsViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import UIKit

protocol MovieDetailsDelegate {
    func movieData(data: MovieDetailsDTO)
    func showError(error: String)
}

class MovieDetailsViewController: UIViewController {

    private var service = MovieDetailsService()
    private var viewModel: MovieDetailsViewModel?
    var idCell: Int?

    private lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .label
        aLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var overviewLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .label
        aLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        aLabel.numberOfLines = 0
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var languageLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textAlignment = .right
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textAlignment = .left
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var backdropPoster: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.alpha = 0.3
        aImage.contentMode = .scaleAspectFill

        view.addSubview(aImage)
        return aImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieDetailsViewModel(movieURL: Constants().movieUrl(id: idCell!), service: service, delegate:  self)
        self.viewModel?.getMovie()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([


            backdropPoster.topAnchor.constraint(equalTo: view.topAnchor),
            backdropPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backdropPoster.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backdropPoster.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            languageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            languageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            languageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            overviewLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 30),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        
        ])
    }

}


extension MovieDetailsViewController: MovieDetailsDelegate {
    
    func movieData(data: MovieDetailsDTO) {
        
        let backdropPath = data.backdropPath
        let url = URL(string: Constants().backdropURL + backdropPath)
        backdropPoster.load(url: url!)
        titleLabel.text = data.originalTitle.uppercased()
        languageLabel.text = "Language: \(data.originalLanguage.uppercased())"
        releaseDateLabel.text = "Released: \(data.releaseDate)"
        overviewLabel.text = data.overview

    }
    
    func showError(error: String) {
        print(error)
    }
    
}
