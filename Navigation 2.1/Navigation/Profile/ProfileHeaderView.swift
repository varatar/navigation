//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var setStatusButton: UIButton!
    
    
    //Создаем константы для их использования во фреймах
    
    private enum Constants {
        static let sideInset: CGFloat = 16.0
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    override func awakeFromNib() {
        
        //Делаем настройки для изображения пользователя (круглая картинка)
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //Делаем настройки кнопки showStatus
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.cornerRadius = 14
        
        //Добавляем обработчик событий для кнопки
        setStatusButton.addTarget(self,
                             action: #selector(buttonPressed),
                             for: .touchUpInside)
        
        //Делаем настройки лейбла nickName
        fullNameLabel.text = "Developer cat"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        //Делаем настройки лейбла currentStatus
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.text = statusText
        
        //Делаем настройки для Текстфилда
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.clipsToBounds = true
        
        //Добавляем обработчик событий для текстфилда
        statusTextField.addTarget(self,
                            action: #selector(statusTextChanged),
                            for: .editingChanged)
        
    }
    
    //Добавляем наши odbc методы
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if textField.text != "" {
            statusText = textField.text
        } else {
            statusText = "No status"
        }
    }
    

    
}
