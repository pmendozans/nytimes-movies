//
//  LoginManager.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import Foundation
import GoogleSignIn
import SwiftyUserDefaults

struct LoginManager {
    
    typealias CompletionHandler = (() -> Void )?
    typealias ErrorHandler = ((String) -> Void )?
    
    func login(withEmail email: String, password: String, completion: CompletionHandler, errorHandler: ErrorHandler){
        if email == "test@nearsoft.com" && password == "demo" {
            Defaults[.isLogged] = true
            Defaults[.email] = email
            completion?()
        }
        else {
            errorHandler?("User not found")
        }
    }
    
    func login(withGoogleUser user: GIDGoogleUser, completion: CompletionHandler){
        Defaults[.email] = user.profile.email
        Defaults[.isLogged] = true
        completion?()
    }
    
    func logout(currentController: UIViewController){
        Defaults[.isLogged] = false
        GIDSignIn.sharedInstance().signOut()
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        currentController.present(loginViewController, animated: true, completion: nil)
    }
}
