//
//  DateManager.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/30/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

struct DateManager {
    func readableDate(fromString dateString: String) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        let date = formater.date(from: dateString)
        let readableFormater = DateFormatter()
        readableFormater.dateFormat = "MMM d, yyyy"
        if let date = date {
            return readableFormater.string(from: date)
        }
        return "unknown"
    }
}
