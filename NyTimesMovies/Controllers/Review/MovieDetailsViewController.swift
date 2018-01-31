//
//  MovieDetailsViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    var movieReviewDetails: MovieReview!
    private let thumbsUpImageName = "thumbs-up"
    private let dateManager = DateManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetailsData()
    }
    
    func loadDetailsData(){
        titleLabel.text = movieReviewDetails.displayTitle
        ratingLabel.text = movieReviewDetails.mppaRating
        directorLabel.text = movieReviewDetails.byline
        summaryTextView.text = movieReviewDetails.summaryShort
        publicationDateLabel.text = dateManager.readableDate(fromString: movieReviewDetails.publicationDate)
        openingDateLabel.text = dateManager.readableDate(fromString: movieReviewDetails.openingDate)
        if (movieReviewDetails.criticsPick) {
            thumbImage.image = UIImage(named: thumbsUpImageName)
        }
    }
}
