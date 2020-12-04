//
//  ViewController.swift
//  Dindin
//
//  Created by Thiago Kuriki on 02/12/20.
//

import UIKit

enum LoginValidation: String {
    case emailInvalid = "Seu e-mail está vazio ou inválido"
    case passwordInvalid = "Sua senha está vazia"
    case minimumPasswordInvalid = "Você precisa digitar 6 dígitos para sua senha"
}

final class LoginController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Private Methods
    private func validateFields() {
        let passwordValue = passwordTextField.text
        
        guard let emailValid = emailTextField.text?.isEmpty,
              let passwordValid = passwordTextField.text?.isEmpty else {
            return
        }
        
        guard !emailValid else {
            showAlert(message: .emailInvalid)
            return
        }
        
        guard !passwordValid else {
            showAlert(message: .passwordInvalid)
            return
        }
        
        guard let passwordCount = passwordValue?.count, passwordCount >= 6 else {
            showAlert(message: .minimumPasswordInvalid)
            return
        }
    }
    
    private func showAlert(title: String = "Aviso", message: LoginValidation) {
        let alertController = UIAlertController(title: title, message: message.rawValue, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Fechar", style: .destructive, handler: nil)
        
        alertController.addAction(dismissAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - IBAction
    @IBAction func handleLogin(_ sender: UIButton) {
        validateFields()
        
        DispatchQueue.main.async {
            let controller = ExtractController()
            let navigationController = UINavigationController(rootViewController: controller)
            
            navigationController.modalPresentationStyle = .fullScreen
            
            self.present(navigationController, animated: true, completion: nil)
        }
    }
}

// MARK: - Layout Extension
extension LoginController {
    private func setupLayout() {
        emailTextField.layer.masksToBounds = false
        passwordTextField.layer.masksToBounds = false
        loginButton.layer.masksToBounds = false
        
        emailTextField.layer.cornerRadius = Constants.cornerRadius
        passwordTextField.layer.cornerRadius = Constants.cornerRadius
        loginButton.layer.cornerRadius = Constants.cornerRadius
        
        emailTextField.setPlaceholder(value: "E-mail")
        passwordTextField.setPlaceholder(value: "Senha")
    }
}
