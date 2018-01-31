//
//  String+Validation.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/30/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}
