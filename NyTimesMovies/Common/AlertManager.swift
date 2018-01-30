//
//  AlertManager.swift
//  NyTimesMovies
//
//  Created by Pablo Arturo Ruiz Mendoza on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

struct AlertManager {
    
    enum ModalType{
        case notCompleteForm
        case invalidEmail
        case serverError
    }
    
    func getModalAlert(modalType: ModalType) -> Modal{
        switch modalType {
        case .notCompleteForm:
            return Modal(title: NSLocalizedString("incomplete-form", comment: ""),
                         message: NSLocalizedString("fill-the-form", comment: ""),
                         closeLabel: NSLocalizedString("accept", comment: ""))
            
        case .invalidEmail:
            return Modal(title: NSLocalizedString("invalid-email-title", comment: ""),
                         message: NSLocalizedString("invalida-email-msg", comment: ""),
                         closeLabel:  NSLocalizedString("accept", comment: ""))
            
        case .serverError:
            return Modal(title: NSLocalizedString("server-error-title", comment: ""),
                         message: NSLocalizedString("server-error-msg", comment: ""),
                         closeLabel:  NSLocalizedString("accept", comment: ""))
        }
    }
}
