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
    
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var reviewTxt: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadReviewPreview(movieReview: MovieReview){
        titleLbl.text = movieReview.displayTitle
        reviewTxt.text = movieReview.summaryShort
        
        guard let thumbnailUrl = movieReview.thumbnail else {
            return
        }
        
        guard let url = URL(string: thumbnailUrl) else {
            return
        }
        thumbnailImg.kf.setImage(with: url)
    }

}
