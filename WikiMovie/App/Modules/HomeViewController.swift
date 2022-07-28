//
//  HomeViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var PopularMoviesbutton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Popular movies"
        configuration.baseBackgroundColor = .red.withAlphaComponent(0.5)
        
        let MovieListVC = MovieListViewController()
        let aButton = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(MovieListVC, animated: true)}))
        aButton.configuration = configuration
        aButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var TitleLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "WikiMOVIE"
        aLabel.textColor = .red
        aLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
        aLabel.textAlignment = .center
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aLabel)
        return aLabel
    }()
    
    private lazy var logoImage: UIImageView = {
        let aImageView = UIImageView()
        aImageView.image = UIImage(named: "popcorn")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        aImageView.contentMode = .scaleAspectFill
        
        view.addSubview(aImageView)
        return aImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        setupConstraints()
        view.backgroundColor = .black
    }

    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            TitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            TitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            logoImage.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 50),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            PopularMoviesbutton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 75),
            PopularMoviesbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            PopularMoviesbutton.heightAnchor.constraint(equalToConstant: 50),
            PopularMoviesbutton.widthAnchor.constraint(equalToConstant: 150),
        
        ])
    }

}

