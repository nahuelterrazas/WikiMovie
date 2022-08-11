//
//  MovieDetailsViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import UIKit
import Kingfisher

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
        aLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var overviewLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        aLabel.numberOfLines = 0
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var languageLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.backgroundColor = .tertiaryLabel
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.backgroundColor = .tertiaryLabel
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var runtimeLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.backgroundColor = .tertiaryLabel
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var voteAverageLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.backgroundColor = .tertiaryLabel
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var genresLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.numberOfLines = 0
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var backdropPoster: UIImageView = {
        let aImage = UIImageView()
        aImage.image = UIImage(named: "backgroundActivityIndicator")
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleToFill
        aImage.alpha = 0.3

        view.addSubview(aImage)
        return aImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieDetailsViewModel(movieURL: Constants().movieUrl(id: idCell ?? 0), service: service, delegate:  self)
        self.viewModel?.getMovie()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([


            backdropPoster.topAnchor.constraint(equalTo: view.topAnchor),
            backdropPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backdropPoster.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backdropPoster.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),

            languageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            languageLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor, constant: 10),
            
            runtimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            runtimeLabel.leadingAnchor.constraint(equalTo: languageLabel.trailingAnchor, constant: 10),
            
            voteAverageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            voteAverageLabel.leadingAnchor.constraint(equalTo: runtimeLabel.trailingAnchor, constant: 10),
            
            genresLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 15),
            genresLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            genresLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            overviewLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 30),
            overviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            overviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        
        ])
    }
}


extension MovieDetailsViewController: MovieDetailsDelegate {
    
    func movieData(data: MovieDetailsDTO) {
        
        titleLabel.text = data.title.uppercased()
        
        if let url = URL(string: Constants().backdropURL + (data.backdropPath)){
            backdropPoster.kf.setImage(with: url, options: [.fromMemoryCacheOrRefresh, .transition(.fade(0.5))])
        }
                
        releaseDateLabel.text = String(data.releaseDate.prefix(4))

        let language = Locale.current.localizedString(forLanguageCode: data.originalLanguage)
        languageLabel.text = language
        
        let runtimeData = data.runtime
        runtimeLabel.text = "\(runtimeData/60)h \(runtimeData%60)m"

        overviewLabel.text = data.overview
        voteAverageLabel.text = "♡ \(Int(data.voteAverage*10))%"
        genresLabel.text = data.genres.first?.name
        
        var i=1
        while i<data.genres.count {
            genresLabel.text! += ", \(data.genres[i].name)"
            i+=1
        }
    }
    
    func showError(error: String) {
        print(error)
    }
}
