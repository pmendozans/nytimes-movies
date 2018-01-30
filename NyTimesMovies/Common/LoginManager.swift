//
//  LoginManager.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import GoogleSignIn

typealias LoginCompletionHandler = (() -> Void )?
typealias LoginErrorHandler = ((String) -> Void )?

struct LoginManager {
    
    func login(withEmail email: String, password: String, completion: LoginCompletionHandler, errorHandler: LoginErrorHandler){
        if email == "test@nearsoft.com" && password == "demo" {
            completion?()
        }
        else {
            errorHandler?("User not found")
        }
    }
    
    func login(withGoogle user: GIDGoogleUser, completion: LoginCompletionHandler, errorHandler: LoginErrorHandler){
        
    }
}
