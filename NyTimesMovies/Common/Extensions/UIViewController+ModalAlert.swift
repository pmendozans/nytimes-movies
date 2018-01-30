//
//  UIViewControlleExtension.swift
//  NyTimesMovies
//
//  Created by Pablo Arturo Ruiz Mendoza on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func openAlertAction(modal: Modal, completion: (() -> Void)?){
        let alertController = UIAlertController(
            title: modal.title,
            message: modal.message,
            preferredStyle: .alert)
        let closeAction = UIAlertAction(title: modal.closeLabel, style: .cancel, handler: nil)
        alertController.addAction(closeAction)
        completion?()
        present(alertController, animated: true, completion: nil)
    }
}
