//
//  MovieReviewsViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class MovieReviewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var movieReviewsList: [MovieReview] = []
    let cellIdentifier = "MovieReviewCell"
    let cellNibName = "MovieReviewCell"
    let reviewViewModel = ReviewViewModel()
    enum ControllerSegue: String {
        case reviewListToDetails = "reviewListToDetails"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        loadMovieReviewsFromApi()
    }

    func loadMovieReviewsFromApi(){
        reviewViewModel.getMovieReviews(offset: 0, completion: { movieReviews in
            self.movieReviewsList = movieReviews
            self.tableView.reloadData()
        }, errorHandler: { _ in
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == ControllerSegue.reviewListToDetails.rawValue {
            let viewController = segue.destination as! MovieDetailsViewController
            let selectedIndex = sender as! Int
            viewController.movieReviewDetails = movieReviewsList[selectedIndex]
        }
        
    }
}

extension MovieReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieReviewsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MoviewReviewCell
        let reviewToLoad = movieReviewsList[indexPath.row]
        reviewCell.selectionStyle = .none
        reviewCell.loadReviewPreview(movieReview: reviewToLoad)
        return reviewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ControllerSegue.reviewListToDetails.rawValue, sender: indexPath.row)
    }
}
