//
//  ViewController.swift
//  MySwiftyJson
//
//  Created by ahmed on 6/3/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    fileprivate let cellIdentifier = "MoviesTableViewCell"
    var moviesArr = [Movie]()
    @IBOutlet var moviesTableView: UITableView!
    
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    var isLoading : Bool = false //to prevent using refresher if there is data still loaded from webservice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = addButton
        
        moviesTableView.addSubview(refresher)
        handleRefresh()
        
    }
    @objc private func handleAdd() {
        let alert = UIAlertController(title: "Add", message: "Are You Sure To Add?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc private func handleRefresh() {
        refresher.endRefreshing()
        guard !isLoading else {return}
        
        self.isLoading = true
        APIManager.loadMovies{(error : Error?, movies : [Movie]?) in
            self.isLoading = false
            if let movies = movies {
                self.moviesArr = movies
                self.moviesTableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MoviesTableViewCell
        
        cell.setEntity(movie: moviesArr[indexPath.row])
        
        return cell
    }
}
//extension ViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return moviesArr.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
//        cell.movileTitle_lbl.text = self.moviesArr[indexPath.row].title
//        cell.movileTitle_lbl.sizeToFit()
//        cell.movieImage_img.sd_setImage(with: URL(string: self.moviesArr[indexPath.row].image), placeholderImage: UIImage(named : "placeholder.png"))
//        return cell
//    }
//}

