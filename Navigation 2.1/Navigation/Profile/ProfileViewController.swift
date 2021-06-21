//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    //Создаем новую UIButton
    private var newButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Добавляем новую кнопку и даем ей рандомные настройки (т.к. в условии задачи не было конкретики)
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .black
        newButton.setTitle("New button", for: .normal)
        
        //Добавляем констрейнты
        let newButtonConstraints = [
        newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
        
        NSLayoutConstraint.activate(newButtonConstraints)
    }
    
}
