//
//  LoginViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var loginWithEmailBtn: UIButton!
    @IBOutlet weak var loginWithGoogleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        
    }
    
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginViewController : GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            return
        }
        print(user)
    }
}
