//
//  ViewController.swift
//  iOS10-HW11-Anton Isakov
//
//  Created by Антон Исаков on 14.06.2023.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 6, width: 20, height: 20))
        iconView.image = image
        let iconContanerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 56, height: 30))
        iconContanerView.addSubview(iconView)
        leftView = iconContanerView
        leftViewMode = .always
    }
}

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textNamePage: UILabel = {
        let textNamePage = UILabel()
        textNamePage.text = "Login"
        textNamePage.layer.cornerRadius = 20
        textNamePage.translatesAutoresizingMaskIntoConstraints = false
        textNamePage.font = UIFont.boldSystemFont(ofSize: 30)
        textNamePage.font = UIFont.preferredFont (forTextStyle: .largeTitle)
        textNamePage.numberOfLines = 5
        return textNamePage
    }()
    
    private lazy var textLogin: UITextField = {
        let textLogin = UITextField()
        textLogin.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        textLogin.placeholder = "Enter your login"
        textLogin.layer.cornerRadius = 20
        textLogin.contentVerticalAlignment = .center
        textLogin.translatesAutoresizingMaskIntoConstraints = false
        textLogin.setLeftIcon(UIImage(systemName: "person.fill") ?? UIImage ())
        textLogin.font = UIFont.systemFont(ofSize: 12)
        return textLogin
    }()
    
    private lazy var textPassword: UITextField = {
        let textPassword = UITextField()
        textPassword.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        textPassword.placeholder = "Enter your password"
        textPassword.layer.cornerRadius = 20
        textPassword.contentVerticalAlignment = .center
        textPassword.translatesAutoresizingMaskIntoConstraints = false
        textPassword.setLeftIcon(UIImage(systemName: "exclamationmark.lock") ?? UIImage ())
        textPassword.font = UIFont.systemFont(ofSize: 12)
        return textPassword
    }()
    
    private lazy var buttonLogin: UIButton = {
        let buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(UIColor.black, for: .normal)
        buttonLogin.backgroundColor = .systemGray
        buttonLogin.layer.cornerRadius = 15
        buttonLogin.layer.shadowColor = UIColor.black.cgColor
        buttonLogin.layer.shadowOpacity = 0.3
        buttonLogin.layer.shadowOffset = .zero
        buttonLogin.layer.shouldRasterize = true
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        return buttonLogin
    }()
    
    private lazy var buttonForgotYourPassword: UIButton = {
        let buttonForgotYourPassword = UIButton(type: .system)
        buttonForgotYourPassword.setTitle("Forgot your password?", for: .normal)
        buttonForgotYourPassword.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .normal)
        buttonForgotYourPassword.translatesAutoresizingMaskIntoConstraints = false
        return buttonForgotYourPassword
    }()
    
    private lazy var stripeLeftViewConnectWith: UIView = {
        let stripeLeftViewConnectWith = UIView()
        stripeLeftViewConnectWith.backgroundColor = .systemGray
        stripeLeftViewConnectWith.translatesAutoresizingMaskIntoConstraints = false
        stripeLeftViewConnectWith.layer.cornerRadius = 10
        stripeLeftViewConnectWith.alpha = 0.5
        return stripeLeftViewConnectWith
    }()
    
    private lazy var stripeRightViewConnectWith: UIView = {
        let stripeRightViewConnectWith = UIView()
        stripeRightViewConnectWith.backgroundColor = .systemGray
        stripeRightViewConnectWith.translatesAutoresizingMaskIntoConstraints = false
        stripeRightViewConnectWith.layer.cornerRadius = 10
        stripeRightViewConnectWith.alpha = 0.5
        return stripeRightViewConnectWith
    }()
    
    private lazy var textConnectWith: UILabel = {
        let textConnectWith = UILabel()
        textConnectWith.text = "or connect with"
        textConnectWith.translatesAutoresizingMaskIntoConstraints = false
        textConnectWith.font = UIFont.systemFont(ofSize: 12)
        textConnectWith.textColor = UIColor.black.withAlphaComponent(0.5)
        return textConnectWith
    }()
    
    private lazy var buttonFacebook: UIButton = {
        let buttonFacebook = UIButton(type: .system)
        buttonFacebook.setTitle("Facebook", for: .normal)
        buttonFacebook.setTitleColor(UIColor.black, for: .normal)
        buttonFacebook.backgroundColor = .systemCyan
        buttonFacebook.layer.cornerRadius = 15
        buttonFacebook.layer.shadowColor = UIColor.black.cgColor
        buttonFacebook.layer.shadowOpacity = 0.3
        buttonFacebook.layer.shadowOffset = .zero
        buttonFacebook.layer.shouldRasterize = true
        buttonFacebook.translatesAutoresizingMaskIntoConstraints = false
        return buttonFacebook
    }()
    
    private lazy var buttonTwitter: UIButton = {
        let buttonTwitter = UIButton(type: .system)
        buttonTwitter.setTitle("Twitter", for: .normal)
        buttonTwitter.setTitleColor(UIColor.black, for: .normal)
        buttonTwitter.backgroundColor = .systemBlue
        buttonTwitter.layer.cornerRadius = 15
        buttonTwitter.layer.shadowColor = UIColor.black.cgColor
        buttonTwitter.layer.shadowOpacity = 0.3
        buttonTwitter.layer.shadowOffset = .zero
        buttonTwitter.layer.shouldRasterize = true
        buttonTwitter.translatesAutoresizingMaskIntoConstraints = false
        return buttonTwitter
    }()
    
    private lazy var textDontHaveAccount: UILabel = {
        let textDontHaveAccount = UILabel()
        textDontHaveAccount.text = "Don't have account?"
        textDontHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        textDontHaveAccount.font = UIFont.systemFont(ofSize: 12)
        textDontHaveAccount.textColor = UIColor.black.withAlphaComponent(0.5)
        return textDontHaveAccount
    }()
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private lazy var signUp: UIButton = {
        let signUp = UIButton(type: .system)
        signUp.setTitle("Sign up?", for: .normal)
        signUp.setTitleColor(UIColor.black, for: .normal)
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return signUp
    }()
    
    //MARK: - Setups
    
    private func setupView() {
        
    }

    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(textNamePage)
        view.addSubview(textLogin)
        view.addSubview(textPassword)
        view.addSubview(buttonForgotYourPassword)
        view.addSubview(buttonLogin)
        view.addSubview(stripeLeftViewConnectWith)
        view.addSubview(stripeRightViewConnectWith)
        view.addSubview(textConnectWith)
        view.addSubview(buttonFacebook)
        view.addSubview(buttonTwitter)
        view.addSubview(textDontHaveAccount)
        view.addSubview(signUp)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint (equalTo: view.centerYAnchor),
            
            textNamePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            textNamePage.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            
            textLogin.topAnchor.constraint(equalTo: textNamePage.topAnchor, constant: 100),
            textLogin.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 50),
            textLogin.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -50),
            textLogin.heightAnchor.constraint(equalToConstant: 38),
            
            textPassword.topAnchor.constraint(equalTo: textLogin.topAnchor, constant: 55),
            textPassword.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 50),
            textPassword.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -50),
            textPassword.heightAnchor.constraint(equalToConstant: 38),
            
            buttonLogin.topAnchor.constraint(equalTo: textPassword.topAnchor, constant: 355),
            buttonLogin.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 50),
            buttonLogin.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -50),
            buttonLogin.heightAnchor.constraint(equalToConstant: 41),
            
            buttonForgotYourPassword.topAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: 60),
            buttonForgotYourPassword.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 50),
            buttonForgotYourPassword.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -50),
            buttonForgotYourPassword.heightAnchor.constraint(equalToConstant: 16),
            
            stripeLeftViewConnectWith.topAnchor.constraint(equalTo: buttonFacebook.topAnchor, constant: -20),
            stripeLeftViewConnectWith.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 70),
            stripeLeftViewConnectWith.widthAnchor.constraint (equalToConstant: 80),
            stripeLeftViewConnectWith.heightAnchor.constraint(equalToConstant: 2),
            
            stripeRightViewConnectWith.topAnchor.constraint(equalTo: buttonTwitter.topAnchor, constant: -20),
            stripeRightViewConnectWith.widthAnchor.constraint (equalToConstant: 80),
            stripeRightViewConnectWith.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -70),
            stripeRightViewConnectWith.heightAnchor.constraint(equalToConstant: 2),
            
            textConnectWith.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            textConnectWith.topAnchor.constraint(equalTo: buttonTwitter.topAnchor, constant: -27),
            
            buttonFacebook.heightAnchor.constraint(equalToConstant: 35),
            buttonFacebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonFacebook.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonFacebook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80),
            
            buttonTwitter.heightAnchor.constraint(equalToConstant: 35),
            buttonTwitter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            buttonTwitter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonTwitter.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            
            textDontHaveAccount.leftAnchor.constraint (equalTo: view.leftAnchor, constant: 100),
            textDontHaveAccount.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: -50),
            
            signUp.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -100),
            signUp.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: -43)
        ])
    }
    
    //MARK: - Actions
    
}

