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
    func validateRequired(textFields: [UITextField]) -> Bool{
        for textField in textFields {
            if (textField.text?.isEmpty)! {
                return false
            }
        }
        return true
    }
}
