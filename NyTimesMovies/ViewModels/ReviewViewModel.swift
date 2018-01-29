//
//  ReviewViewModel.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ReviewViewModel {
    
    let reviewService = ReviewService()
    
    func getMovieReviews(offset: Int, completion: (([MovieReview]) -> Void)?, errorHandler: ((Error) -> Void)?){

        reviewService.getMovieReviews(byResourceType: .all, order: .openingDate, offset: 20, completion: { jsonResponse in
            var moviewReviews: [MovieReview] = []
            for jsonReview in jsonResponse.arrayValue {
                let review = MovieReview(json: jsonReview)
                moviewReviews.append(review)
            }
            completion?(moviewReviews)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
}
