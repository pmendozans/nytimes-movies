//
//  FormValidator.swift
//  NyTimesMovies
//
//  Created by Pablo Arturo Ruiz Mendoza on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

struct FormValidator {
    func validateEmail(_ input: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: input)
    }
    
    func validateRequired(textFields: [UITextField]) -> Bool{
        for textField in textFields {
            if (textField.text?.isEmpty)! {
                return false
            }
        }
        return true
    }
}
