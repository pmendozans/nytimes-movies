//
//  LoginManager.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import GoogleSignIn

typealias LoginCompletionHandler = (() -> Void )
typealias LoginErrorHandler = (() -> Void )

struct LoginManager {
    
    func login(withEmail email: String, password: String, completion: ()){
        
    }
    
    func login(withGoogle user: GIDGoogleUser){
        
    }
}
