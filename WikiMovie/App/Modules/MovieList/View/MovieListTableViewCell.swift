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
            movieName.text = name
        }
    }
    
    var image: UIImage? {
        didSet{
            placeholderImage.image = image
        }
    }
    
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
    
    private lazy var movieName: UILabel = {
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
            
            placeholderImage.widthAnchor.constraint(equalToConstant: 100),
            placeholderImage.heightAnchor.constraint(equalToConstant: 150),
        
            placeholderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            placeholderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            placeholderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            movieName.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)

        ])
    }

}
