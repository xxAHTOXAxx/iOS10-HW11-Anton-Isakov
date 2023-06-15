//
//  ViewController.swift
//  iOS10-HW11-Anton Isakov
//
//  Created by Антон Исаков on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "backgrond")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var buttonLogin: UIButton = {
        let buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .systemGray
        return buttonLogin
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setups
    
    private func setupView() {
        
    }

    private func setupHierarchy() {
        view.addSubview(imageView)
        
    }
    
    private func setupLayout() {
        
    }
    
    //MARK: - Actions
    
}

