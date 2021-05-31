//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    private let showStatus = UIButton()
    private var nickName = UILabel()
    private var userImage = UIImageView()
    private var currentStatus = UILabel()
    private var setStatus = UITextField()
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(showStatus)
        addSubview(nickName)
        addSubview(userImage)
        addSubview(currentStatus)
        addSubview(setStatus)
        
        //Делаем настройки кнопки showStatus
        showStatus.setTitle("Show status", for: .normal)
        showStatus.backgroundColor = .systemBlue
        showStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatus.layer.shadowRadius = 4.0
        showStatus.layer.shadowOpacity = 0.7
        showStatus.layer.shadowColor = UIColor.black.cgColor
        showStatus.layer.cornerRadius = 12
        //добавляю свечение кнопке, чтобы было видно, когда нажимаю ее
        showStatus.showsTouchWhenHighlighted = true
        
        
        //Добавляем обработчик событий для кнопки
        showStatus.addTarget(self,
                             action: #selector(buttonPressed),
                             for: .touchUpInside)
        
        //Делаем настройки лейбла nickName
        nickName.text = "Developer cat"
        nickName.textColor = .black
        nickName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        //Делаем настройки лейбла currentStatus
        currentStatus.textColor = .gray
        currentStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        currentStatus.text = statusText
        
        //Делаем настройки для изображения пользователя (круглая картинка)
        userImage.layer.borderWidth = 3.0
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.clipsToBounds = true
        userImage.image = UIImage(named: "myCat")
        
        //Делаем настройки для Текстфилда
        setStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setStatus.textColor = .black
        setStatus.backgroundColor = .white
        setStatus.layer.cornerRadius = 12
        setStatus.layer.borderWidth = 1.0
        setStatus.layer.borderColor = UIColor.black.cgColor
        
        //Добавляем обработчик событий для текстфилда
        setStatus.addTarget(self,
                            action: #selector(statusTextChanged),
                            for: .editingChanged)
        
    }
    
    //Добавляем наши odbc методы
    @objc func buttonPressed() {
        currentStatus.text = statusText
    }
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = setStatus.text ?? "No status"
    }
    
    
    override func layoutSubviews() {
        showStatus.frame = CGRect( x: self.safeAreaInsets.left + 16,
                                  y: self.safeAreaInsets.top + 150,
                                  width: self.bounds.width - self.safeAreaInsets.left - self.safeAreaInsets.right - 16*2,
                                  height: 50)
        nickName.frame = CGRect(x: self.safeAreaInsets.left + 132,
                                y: self.safeAreaInsets.top + 16,
                                width: self.bounds.width,
                                height: 50)
        currentStatus.frame = CGRect(x: self.safeAreaInsets.left + 132,
                                y: self.safeAreaInsets.top + 60,
                                width: self.bounds.width,
                                height: 50)
        userImage.frame = CGRect(x: self.safeAreaInsets.left + 16,
                                 y: self.safeAreaInsets.top + 16,
                                 width: 100,
                                 height: 100)
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        setStatus.frame = CGRect(x: self.safeAreaInsets.left + 132,
                                 y: showStatus.frame.minY - setStatus.bounds.height - 10,
                                 width: self.bounds.width - self.safeAreaInsets.left - self.safeAreaInsets.right - 148,
                                 height: 40)
        setStatus.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setStatus.frame.height))
        setStatus.leftViewMode = .always
    }
    
}


