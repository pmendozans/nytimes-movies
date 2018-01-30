//
//  Modal.swift
//  NyTimesMovies
//
//  Created by Pablo Arturo Ruiz Mendoza on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

struct Modal {
    var title: String
    var message: String
    var closeLabel: String
    
    init(title: String = "", message: String, closeLabel: String){
        self.title = title
        self.message = message
        self.closeLabel = closeLabel
    }
}
