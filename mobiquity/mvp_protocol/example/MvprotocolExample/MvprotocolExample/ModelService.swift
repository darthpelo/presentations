//
//  ModelService.swift
//  MvprotocolExample
//
//  Created by Alessio Roberto on 07/02/2017.
//  Copyright © 2017 Alessio Roberto. All rights reserved.
//

import Foundation

final class ModelService {
    
    // Only for demo purpose, it will be a DB or Web API
    private var model = Model()
    
    class var sharedInstance: ModelService {
        struct Singleton {
            static let instance = ModelService()
        }
        return Singleton.instance
    }
    
    func updateModel(userName: Bool, passWord: Bool, userNameValid isValid: Bool) {
        model.usernameIsEmpty = userName
        model.passwordIsEmpty = passWord
        model.usernameIsValid = isValid
    }
    
    func update(userName: Bool) {
        model.usernameIsEmpty = userName
    }
    
    func update(passWord: Bool) {
        model.passwordIsEmpty = passWord
    }
    
    func update(usernameValid: Bool) {
        model.usernameIsValid = usernameValid
    }
    
    func userName() -> Bool {
        return model.usernameIsEmpty
    }
    
    func passWord() -> Bool {
        return model.passwordIsEmpty
    }
    
    func userNameIsValid() -> Bool {
        return model.usernameIsValid
    }
}
