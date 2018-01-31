//
//  MoviewReviewCell.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Kingfisher

class MoviewReviewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!
        
    func loadReviewPreview(movieReview: MovieReview){
        titleLabel.text = movieReview.displayTitle
        reviewTextView.text = movieReview.summaryShort
        
        guard let thumbnailUrl = movieReview.thumbnail else {
            return
        }
        
        guard let url = URL(string: thumbnailUrl) else {
            return
        }
        thumbnailImage.kf.setImage(with: url)
    }

}
