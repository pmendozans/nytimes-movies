//
//  LoginViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import GoogleSignIn
import SwiftyUserDefaults

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginWithEmailButton: UIButton!
    @IBOutlet weak var loginWithGoogleButton: UIButton!
    private let loginManager = LoginManager()
    private let alertManager = AlertManager()
    private let formValidator = FormValidator()
    private var requiredFields: [UITextField] = []
    private let loginSegue = "loginToReviews"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateLogin()
        setupGoogleLogin()
    }
    
    func setupGoogleLogin() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateLogin()
    }
    
    func validateLogin(){
        let isLoged = Defaults[.isLogged]
        if (isLoged) {
            performSegue(withIdentifier: loginSegue, sender: nil)
        }
    }
    
    func isFormValid() -> Bool {
        guard let email = emailTextField.text, email.isEmpty else {
            openAlertAction(modal: alertManager.getModalAlert(modalType: .notCompleteForm), completion: nil)
            return false
        }
        guard let password = passwordTextField.text, password.isEmpty else {
            openAlertAction(modal: alertManager.getModalAlert(modalType: .notCompleteForm), completion: nil)
            return false
        }
        if !email.isValidEmail() {
            openAlertAction(modal: alertManager.getModalAlert(modalType: .invalidEmail), completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        if !isFormValid() {
            return
        }
        loginManager.login(withEmail: self.emailTextField.text!, password: passwordTextField.text!, completion: {
            self.performSegue(withIdentifier: self.loginSegue, sender: nil)
        }, errorHandler: { error in
            let errorInformation = Modal(message: error, closeLabel: "Accept")
            self.openAlertAction(modal: errorInformation, completion: nil)
        })
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
        loginManager.login(withGoogleUser: user, completion: {
            self.performSegue(withIdentifier: self.loginSegue, sender: nil)
        })
    }
}
