//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Ira on 30.03.2023.
//

import UIKit
import SwiftUI

final class LogInHederView: UIView {
    
    private let normalFieldColor = UIColor.systemGray6
    private let errorFieldColor = UIColor.red.withAlphaComponent(0.3)
 
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray4
        stackView.axis = .vertical

        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        return stackView
    }()

    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 12
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.placeholder = " Имя пользователя"
        textField.backgroundColor = normalFieldColor
        textField.delegate = self
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = UIColor(Color.accentColor)
        textField.autocapitalizationType = .none
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.placeholder = " Пароль"
        textField.backgroundColor = normalFieldColor
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
   
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true

        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: "logo")
        return image
    }()
    
    private lazy var logButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLoginButtonTarget(_ target: Any?, action: Selector) {
        logButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func validateInputs() -> Bool {
        let nameLen = userNameTextField.text?.count ?? 0
        let passLen = passwordTextField.text?.count ?? 0
        var isError = nameLen == 0 && passLen == 0
        userNameTextField.backgroundColor = nameLen > 0 ? normalFieldColor : errorFieldColor
        passwordTextField.backgroundColor = passLen > 0 ? normalFieldColor : errorFieldColor
        if (isError) {
            return false
        }

        if (passLen < 8) {
            errorLabel.text = "Пароль должен быть не меньше 8 символов"
            errorLabel.isHidden = false
            isError = true
        } else if (!isStringEmail(str: userNameTextField.text ?? "")) {
            errorLabel.text = "Неверный формат имени пользователя (email)"
            errorLabel.isHidden = false
            isError = true
        } else {
            errorLabel.isHidden = true
        }
        return !isError
    }
    
    func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        stackView.addSubview(userNameTextField)
        stackView.addSubview(passwordTextField)
        stackView.addSubview(errorLabel)
        contentView.addSubview(logButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            userNameTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            userNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            errorLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            logButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 16),
            logButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logButton.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant: -16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func getName() -> String {
        return userNameTextField.text ?? "";
    }
    
    func getPass() -> String {
        return passwordTextField.text ?? "";
    }
}

extension LogInHederView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = normalFieldColor
        errorLabel.isHidden = true
    }
}
