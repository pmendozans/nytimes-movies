//
//  NyTimesMoviesTests.swift
//  NyTimesMoviesTests
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import XCTest
@testable import NyTimesMovies

class NyTimesMoviesTests: XCTestCase {
    
    func testPasswordIsValid() {
        let formValidator = FormValidator()
        let validPassword = "pmendoza@ns.com"
        let isEmailValid = formValidator.validateEmail(validPassword)
        XCTAssertTrue(isEmailValid)
        
    }
    
    func testPasswordIsInvalid(){
        let formValidator = FormValidator()
        let validPassword = "pmendoza@nearsoft"
        let isEmailValid = formValidator.validateEmail(validPassword)
        XCTAssertFalse(isEmailValid)
    }
    
}
