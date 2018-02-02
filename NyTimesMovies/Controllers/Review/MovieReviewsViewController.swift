//
//  MovieReviewsViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class MovieReviewsViewController: UIViewController {
    
    @IBOutlet weak var profileBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var movieReviewsList: [MovieReview] = []
    private let cellIdentifier = "ReviewCell"
    private let cellNibName = "MovieReviewCell"
    private let reviewViewModel = ReviewViewModel()
    private let alertManager = AlertManager()
    private let reviewListToDetails = "reviewListToDetails"
    private var lastLoadedListOffset = 0
    private var hasLoadedAllReviews = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadMovieReviewsFromApi()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func loadMovieReviewsFromApi(){
        activityIndicator.startAnimating()
        reviewViewModel.getMovieReviews(offset: lastLoadedListOffset, completion: { movieReviews in
            self.lastLoadedListOffset += 1
            if(movieReviews.count == 0){
                self.hasLoadedAllReviews = true
            }
            self.movieReviewsList.append(contentsOf: movieReviews)
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }, errorHandler: { _ in
            self.openAlertAction(modal: self.alertManager.getModalAlert(modalType: .serverError), completion: nil)
            self.activityIndicator.stopAnimating()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == reviewListToDetails {
            let viewController = segue.destination as! MovieDetailsViewController
            let selectedIndex = sender as! Int
            viewController.movieReviewDetails = movieReviewsList[selectedIndex]
        }
    }
}

// MARK: - UITableViewDelegate
extension MovieReviewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: reviewListToDetails, sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if hasLoadedAllReviews {
            return
        }

        if indexPath.row == movieReviewsList.count-2 {
            loadMovieReviewsFromApi()
        }
    }
}

// MARK: - UITableViewDataSource
extension MovieReviewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieReviewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MoviewReviewCell
        let reviewToLoad = movieReviewsList[indexPath.row]
        reviewCell.selectionStyle = .none
        reviewCell.loadReviewPreview(movieReview: reviewToLoad)
        return reviewCell
    }
}
