//
//  ViewController.swift
//  MyMovies
//
//  Created by Cleís Aurora Pereira on 18/10/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let addMovieViewController = UIStoryboard(name: "AddMovie", bundle: Bundle.main).instantiateInitialViewController()

        navigationController?.pushViewController(addMovieViewController!, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailViewController = UIStoryboard(name: "MovieDetail", bundle: nil).instantiateInitialViewController() as! MovieDetailViewController

        movieDetailViewController.setup(movieSet: MovieDB.shared.movies[indexPath.row])

        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieDB.shared.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieViewCell

        cell.setup(movie: MovieDB.shared.movies[indexPath.row])

        return cell
    }
}

