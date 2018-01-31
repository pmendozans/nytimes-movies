//
//  MovieReview.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MovieReview {
    var displayTitle: String
    var mppaRating: String
    var criticsPick: Bool
    var byline: String
    var headline: String
    var summaryShort: String
    var publicationDate: String
    var openingDate: String
    var dateUpdated: String
    var thumbnail: String?
    
    init(json: JSON){
        displayTitle = json["display_title"].stringValue
        mppaRating = json["mpaa_rating"].stringValue
        criticsPick = json["critics_pick"].boolValue
        byline = json["byline"].stringValue
        headline = json["headline"].stringValue
        summaryShort = json["summary_short"].stringValue
        publicationDate = json["publication_date"].stringValue
        openingDate = json["opening_date"].stringValue
        dateUpdated = json["date_updated"].stringValue
        thumbnail = json["multimedia"]["src"].string
    }
}
