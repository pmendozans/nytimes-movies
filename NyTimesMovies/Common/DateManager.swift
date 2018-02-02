//
//  DateManager.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/30/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

class DateManager {
    func transformStringToDate(fromString dateString: String, inputFormat: String) -> Date? {
        let formater = DateFormatter()
        formater.dateFormat = inputFormat
        if let date = formater.date(from: dateString){
            return date
        }
        return nil
        /*
        let readableFormater = DateFormatter()
        readableFormater.dateFormat = "MMM d, yyyy"
        if let date = date {
            return readableFormater.string(from: date)
        }
        return nil*/
    }
}
