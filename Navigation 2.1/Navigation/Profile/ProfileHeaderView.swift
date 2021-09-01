//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText = String()
    
        var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.image = UIImage(named: "myCat")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.toAutoLayout()
        return avatarImageView
    }()
    
     var transparentView: UIView = {
        let alphaView = UIView()
        alphaView.alpha = 0.0
        alphaView.backgroundColor = .white
        alphaView.toAutoLayout()
        return alphaView
    }()
    
    var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setTitle("Show status", for: .normal)
        closeButton.backgroundColor = .systemBlue
        closeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        closeButton.layer.shadowRadius = 4.0
        closeButton.layer.shadowOpacity = 0.7
        closeButton.layer.shadowColor = UIColor.black.cgColor
        closeButton.layer.cornerRadius = 14
        closeButton.toAutoLayout()
        closeButton.addTarget(self,
                             action: #selector(buttonPressed),
                             for: .touchUpInside)
        return closeButton
    }()
    
    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Developer cat"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.toAutoLayout()
        return fullNameLabel
    }()
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.toAutoLayout()
        return statusLabel
    }()
    
    private var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.clipsToBounds = true
        statusTextField.toAutoLayout()
        statusTextField.addTarget(self,
                            action: #selector(statusTextChanged),
                            for: .editingChanged)
        return statusTextField
    }()
    
    private var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.cornerRadius = 14
        setStatusButton.toAutoLayout()
        setStatusButton.addTarget(self,
                             action: #selector(buttonPressed),
                             for: .touchUpInside)
        return setStatusButton
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubViews( fullNameLabel, statusLabel, statusTextField, setStatusButton, transparentView, avatarImageView)
        
        let constraints = [
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -10),
            statusLabel.heightAnchor.constraint(equalToConstant: 14),
            
            transparentView.topAnchor.constraint(equalTo: self.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    @available(*, unavailable)
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    //Добавляем наши odbc методы
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? "No status"
    }
    
    
}
