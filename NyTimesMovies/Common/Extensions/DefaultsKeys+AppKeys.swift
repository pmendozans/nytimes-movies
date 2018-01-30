//
//  SwiftyUserDefaultsExtension.swift
//  NyTimesMovies
//
//  Created by Pablo Arturo Ruiz Mendoza on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let email = DefaultsKey<String>("email")
    static let isLogged = DefaultsKey<Bool>("isLoged")
}
