//
//  MovieListTableViewCell.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 20/07/2022.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    // para ser accesible desde el controller, creo var
    
    var name: String? {
        didSet{
            movieNameLabel.text = name
        }
    }
    
    var image: UIImage? {
        didSet{
            placeholderImage.image = image
        }
    }
    
    var id: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var placeholderImage: UIImageView = {
        let aImage = UIImageView()
        aImage.image = UIImage(named: "popcorn")
        aImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(aImage)
        return aImage
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(aLabel)
        return aLabel
    }()
    
    private func setupView() {
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            placeholderImage.widthAnchor.constraint(equalToConstant: 80),
            placeholderImage.heightAnchor.constraint(equalToConstant: 120),
        
            placeholderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            placeholderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            placeholderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            movieNameLabel.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor, constant: 15),
            movieNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            movieNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            movieNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)

        ])
    }

}
