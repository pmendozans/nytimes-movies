//
//  Date+Format.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 2/1/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

extension Date {
    func formatToReadableString(format: String) -> String {
        let readableFormater = DateFormatter()
        //readableFormater.dateFormat = "MMM d, yyyy"
        readableFormater.dateFormat = format
        return readableFormater.string(from: self)
    }
}
