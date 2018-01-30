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
    
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var loginWithEmailBtn: UIButton!
    @IBOutlet weak var loginWithGoogleBtn: UIButton!
    private let loginManager = LoginManager()
    private let alertManager = AlertManager()
    private let formValidator = FormValidator()
    private var requiredFields: [UITextField] = []
    private let loginSegue = "loginToReviews"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateLogin()
        requiredFields = [emailTf, passwordTf]
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
    
    @IBAction func loginWithEmail(_ sender: Any) {
        if (!formValidator.validateRequired(textFields: requiredFields)) {
            openAlertAction(modal: alertManager.getModalAlert(modalType: .notCompleteForm), completion: nil)
        } else if (!formValidator.validateEmail(emailTf.text!)){
            openAlertAction(modal: alertManager.getModalAlert(modalType: .invalidEmail), completion: nil)
        } else {
            loginManager.login(withEmail: emailTf.text!, password: passwordTf.text!, completion: {
                self.performSegue(withIdentifier: self.loginSegue, sender: nil)
            }, errorHandler: { error in
                let errorInformation = Modal(message: error, closeLabel: "Accept")
                self.openAlertAction(modal: errorInformation, completion: nil)
            })
        }
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
