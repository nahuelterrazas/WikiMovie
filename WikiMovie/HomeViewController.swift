//
//  HomeViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var Loginbutton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Log in"
        configuration.baseBackgroundColor = .black
        
        let MovieListVC = MovieListViewController()
        let aButton = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.navigationController?.pushViewController(MovieListVC, animated: true)}))
        aButton.configuration = configuration
        aButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aButton)
        return aButton
    }()
    
    private lazy var TitleLabbel: UILabel = {
        let aLbl = UILabel()
        aLbl.text = "wikiM0VIE"
        aLbl.textColor = .white
        aLbl.font = UIFont(name: "Arial Rounded MT Bold", size: 50)
        aLbl.textAlignment = .center
        aLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLbl)
        return aLbl
    }()
    
    private lazy var logoImage: UIImageView = {
        let aImageView = UIImageView()
        aImageView.image = UIImage(named: "popcorn")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aImageView)
        return aImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        setupConstraints()
        view.backgroundColor = .systemRed
    }

    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            TitleLabbel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            TitleLabbel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            logoImage.topAnchor.constraint(equalTo: TitleLabbel.bottomAnchor, constant: 50),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            Loginbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Loginbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            Loginbutton.heightAnchor.constraint(equalToConstant: 50),
            Loginbutton.widthAnchor.constraint(equalToConstant: 150),
        
        ])
    }

}

