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
        textNamePage.textAlignment = .center
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
        let buttonFacebook = UIButton()
        let facebookIcon = UIImage(named: "facebook")
        buttonFacebook.setImage(facebookIcon, for: .normal)
        buttonFacebook.imageView?.contentMode = .scaleAspectFill
        buttonFacebook.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 40)
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
        let buttonTwitter = UIButton()
        buttonTwitter.setTitle("Twitter", for: .normal)
        let twitterIcon = UIImage(named: "twitter")
        buttonTwitter.setImage(twitterIcon, for: .normal)
        buttonTwitter.imageView?.contentMode = .scaleAspectFit
        buttonTwitter.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 40)
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
        
        let height = view.bounds.height // 812
        let width = view.bounds.width // 375
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint (equalTo: view.centerYAnchor),
            
            textNamePage.topAnchor.constraint(equalTo: view.topAnchor, constant: height * 0.1),
            textNamePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width * 0.05),
            textNamePage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width * 0.05),
            
            textLogin.topAnchor.constraint(equalTo: textNamePage.bottomAnchor, constant: height * 0.03),
            textLogin.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.13),
            textLogin.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.13),
            textLogin.heightAnchor.constraint(equalToConstant: 38),
            
            textPassword.topAnchor.constraint(equalTo: textLogin.bottomAnchor, constant: height * 0.02),
            textPassword.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.13),
            textPassword.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.13),
            textPassword.heightAnchor.constraint(equalToConstant: 38),
            
            buttonLogin.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: height * 0.30),
            buttonLogin.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.13),
            buttonLogin.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.13),
            buttonLogin.heightAnchor.constraint(equalToConstant: 41),
            
            buttonForgotYourPassword.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: height * 0.02),
            buttonForgotYourPassword.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.13),
            buttonForgotYourPassword.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.13),
            buttonForgotYourPassword.heightAnchor.constraint(equalToConstant: 16),
            
            stripeLeftViewConnectWith.bottomAnchor.constraint(equalTo: buttonFacebook.topAnchor, constant: -height * 0.04),
            stripeLeftViewConnectWith.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.13),
            stripeLeftViewConnectWith.widthAnchor.constraint (equalToConstant: width * 0.23),
            stripeLeftViewConnectWith.heightAnchor.constraint(equalToConstant: 2),
            
            stripeRightViewConnectWith.bottomAnchor.constraint(equalTo: buttonTwitter.topAnchor, constant: -height * 0.04),
            stripeRightViewConnectWith.widthAnchor.constraint (equalToConstant: width * 0.23),
            stripeRightViewConnectWith.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.13),
            stripeRightViewConnectWith.heightAnchor.constraint(equalToConstant: 2),
            
            textConnectWith.topAnchor.constraint(equalTo: buttonTwitter.topAnchor, constant: -height * 0.05),
            textConnectWith.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            
            buttonFacebook.heightAnchor.constraint(equalToConstant: 35),
            buttonFacebook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width * 0.13),
            buttonFacebook.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height * 0.11),
            buttonFacebook.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -width * 0.2),
            
            buttonTwitter.heightAnchor.constraint(equalToConstant: 35),
            buttonTwitter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width * 0.13),
            buttonTwitter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height * 0.11),
            buttonTwitter.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: width * 0.2),
            
            //buttonTwitter.leadingAnchor.constraint(greaterThanOrEqualTo: buttonFacebook.trailingAnchor, constant: 40),
            
            textDontHaveAccount.leftAnchor.constraint (equalTo: view.leftAnchor, constant: width * 0.25),
            textDontHaveAccount.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: -height * 0.07),
            
            signUp.rightAnchor.constraint (equalTo: view.rightAnchor, constant: -width * 0.28),
            signUp.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: -height * 0.0615)
        ])
    }
    //MARK: - Actions
    
}

