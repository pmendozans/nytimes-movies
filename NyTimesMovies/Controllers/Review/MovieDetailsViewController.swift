//
//  MovieDetailsViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var criticsPickLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var publicationDateLbl: UILabel!
    @IBOutlet weak var openingDateLbl: UILabel!
    @IBOutlet weak var summaryTxt: UITextView!
    
    var movieReviewDetails: MovieReview!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetailsData()
    }
    
    func loadDetailsData(){
        titleLbl.text = movieReviewDetails.displayTitle
        ratingLbl.text = movieReviewDetails.mppaRating
        criticsPickLbl.text = movieReviewDetails.criticsPick
        directorLbl.text = movieReviewDetails.byline
        summaryTxt.text = movieReviewDetails.summaryShort
        publicationDateLbl.text = movieReviewDetails.publicationDate
        openingDateLbl.text = movieReviewDetails.openingDate
    }
}
