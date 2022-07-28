//
//  MovieListViewController.swift
//  WikiMovie
//
//  Created by Nahuel Terrazas on 19/07/2022.
//

import Foundation
import UIKit

protocol MovieListDelegate {
    func reloadTable()
    func showError(error: String)
}

class MovieListViewController: UIViewController{
    

    private var service = MovieListService()
    private var viewModel: MovieListViewModel?
    
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        aTable.rowHeight = 140
        aTable.register(MovieListTableViewCell.self, forCellReuseIdentifier: String(describing: MovieListTableViewCell.self))
        view.addSubview(aTable)
        return aTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieListViewModel(service: service, delegate:  self)
        self.viewModel?.getMovies()
    }
    
    func setupView(){
        title = "Movies"
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
        let cell = tableView.cellForRow(at: indexPath) as! MovieListTableViewCell

        let movieDetailsVC = MovieDetailsViewController()
        movieDetailsVC.idCell = cell.id

        self.present(movieDetailsVC, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.moviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieListTableViewCell.self), for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle  = .none

        let aMovie = self.viewModel?.getAMovie(at: indexPath.row)
        cell.name = aMovie?.title
        
        if let url = URL(string: Constants().posterURL + (aMovie?.posterPath ?? "")) {
            cell.placeholderImage.load(url: url)
        }
        cell.id = aMovie?.id
        
        return cell
    }
}

extension MovieListViewController: MovieListDelegate{
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        print("Algo fallo: ", error)
    }
}
