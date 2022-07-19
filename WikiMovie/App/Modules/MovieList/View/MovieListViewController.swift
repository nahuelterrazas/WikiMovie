//
//  MovieListViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController{
    

    private var service = MovieListService()
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self

        view.addSubview(aTable)
        return aTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = .red
        title = "Movies"
        setupConstraints()
        service.getMovies { movies in
            print(movies)
        } onError: { error in
            print(error)
        }

    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsPresent = MovieDetailsViewController()
        self.present(movieDetailsPresent, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Celda numero \(indexPath.row+1)"
        return cell
    }
    
    
}
