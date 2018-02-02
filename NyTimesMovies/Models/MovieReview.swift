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
    var publicationDate: Date?
    var openingDate: Date?
    var dateUpdated: Date?
    var thumbnail: String?
    
    init(json: JSON){
        let dateManager = DateManager()
        displayTitle = json["display_title"].stringValue
        mppaRating = json["mpaa_rating"].stringValue
        criticsPick = json["critics_pick"].boolValue
        byline = json["byline"].stringValue
        headline = json["headline"].stringValue
        summaryShort = json["summary_short"].stringValue
        publicationDate = dateManager.transformStringToDate(fromString: json["publication_date"].stringValue, inputFormat: "yyyy-MM-dd")
        openingDate = dateManager.transformStringToDate(fromString: json["opening_date"].stringValue, inputFormat: "yyyy-MM-dd")
        dateUpdated = dateManager.transformStringToDate(fromString: json["date_updated"].stringValue, inputFormat: "yyyy-MM-dd")
        thumbnail = json["multimedia"]["src"].string
    }
}
