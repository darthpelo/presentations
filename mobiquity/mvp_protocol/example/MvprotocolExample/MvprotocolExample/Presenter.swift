//
//  Presenter.swift
//  MvprotocolExample
//
//  Created by Alessio Roberto on 07/02/2017.
//  Copyright © 2017 Alessio Roberto. All rights reserved.
//

import Foundation

protocol ViewProtocol: class {
    func button(isEnable: Bool)
    func email(isValid: Bool)
}

struct Presenter {
    weak var view: ViewProtocol?
    
    func setupView() {
        view?.button(isEnable: false)
        ModelService.sharedInstance.updateModel(userName: true, passWord: true)
    }
    
    func update(username status: Bool?) {
        ModelService.sharedInstance.update(userName: status ?? true)
        view?.button(isEnable: !(ModelService.sharedInstance.userName() || ModelService.sharedInstance.passWord()))
    }
    
    func update(password status: Bool?) {
        ModelService.sharedInstance.update(passWord: status ?? true)
        view?.button(isEnable: !(ModelService.sharedInstance.userName() || ModelService.sharedInstance.passWord()))
    }
    
    func check(text: String?) {
        let valid = Validator().isValid(text ?? "")
        
        view?.email(isValid: valid)
        view?.button(isEnable: (valid && !(ModelService.sharedInstance.userName() || ModelService.sharedInstance.passWord()) ))
    }
}

struct Validator {
    /// Validate email string
    ///
    /// - parameter email: A String that rappresent an email address
    ///
    /// - returns: A Boolean value indicating whether an email is valid.
    func isValid(_ text: String) -> Bool {
        let textRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let test = NSPredicate(format:"SELF MATCHES[c] %@", textRegEx)
        return test.evaluate(with: text)
    }
}
