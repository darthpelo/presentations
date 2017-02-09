//
//  ViewController.swift
//  MvprotocolExample
//
//  Created by Alessio Roberto on 07/02/2017.
//  Copyright © 2017 Alessio Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    lazy var presenter: Presenter = Presenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setupView()
    }

    @IBAction func sendButtonTapped(_ sender: Any) {
        
    }

}

extension ViewController: ViewProtocol {
    func button(isEnable: Bool) {
        sendButton.isEnabled = isEnable
    }
    
    func email(isValid: Bool) {
        usernameTextField.textColor = isValid ? .black : .red
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == usernameTextField {
            presenter.update(username: textField.text?.isEmpty)
            presenter.check(text: textField.text?.appending(string))
        } else {
            presenter.update(password: textField.text?.appending(string).isEmpty)
        }
        
        return true
    }
}
