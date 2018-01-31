//
//  ProfileViewController.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    private let loginManager = LoginManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = Defaults[.email]
    }

    @IBAction func logout(_ sender: Any) {
        loginManager.logout(currentController: self)
    }
    
}
