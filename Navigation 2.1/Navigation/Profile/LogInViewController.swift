//
//  LogInViewController.swift
//  Navigation
//
//  Created by Евгений Матафонов on 13.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: Создаем UI
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let loginFormView: UIView = {
        let loginForm = UIView()
        loginForm.layer.borderColor = UIColor.lightGray.cgColor
        loginForm.layer.borderWidth = 0.5
        loginForm.layer.cornerRadius = 10.0
        loginForm.toAutoLayout()
        loginForm.backgroundColor = .systemGray6
        return loginForm
    }()
    
    private let loginView: UIView = {
       let login = UIView()
        //login.backgroundColor = .blue
        login.toAutoLayout()
        login.layer.cornerRadius = 10.0
        return login
    }()
    
    private var loginTextField: UITextField = {
        let loginText = UITextField()
        loginText.toAutoLayout()
        loginText.textColor = .black
        loginText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginText.autocapitalizationType = .none
        loginText.placeholder = "Email or phone"
        loginText.tintColor = UIColor(named: "ColorSet")
        return loginText
    }()
    
    private let passwordView: UIView = {
       let password = UIView()
        //password.backgroundColor = .red
        password.toAutoLayout()
        password.layer.cornerRadius = 10.0
        return password
    }()
    
    private var passwordTextField: UITextField = {
        let password = UITextField()
        password.toAutoLayout()
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        password.tintColor = UIColor(named: "ColorSet")
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        return password
    }()
    
    private let separatorView: UIView = {
        let separate = UIView()
        separate.toAutoLayout()
        separate.layer.borderColor = UIColor.lightGray.cgColor
        separate.layer.borderWidth = 0.5
        return separate
    }()
    
    private let loginScrollView: UIScrollView = {
        let loginScrollView = UIScrollView()
        loginScrollView.toAutoLayout()
        return loginScrollView
    }()
    
    private let containerView: UIView = {
        let container = UIView()
        container.toAutoLayout()
        return container
    }()
    
    
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 10.0
        loginButton.clipsToBounds = true
        loginButton.setTitle("Log in", for: .normal)
        loginButton.toAutoLayout()
        loginButton.layer.masksToBounds = true
        return loginButton
    }()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setupUI()

    }
    
    //Создаем метод, который потом используем во viewDidLoad
    func setupUI() {
        
        guard let pixelImage = UIImage(named: "blue_pixel") else { return }
        loginButton.setBackgroundImage(pixelImage.alpha(1.0), for: .normal)
        loginButton.setBackgroundImage(pixelImage.alpha(0.8), for: .selected)
        loginButton.setBackgroundImage(pixelImage.alpha(0.8), for: .highlighted)
        loginButton.setBackgroundImage(pixelImage.alpha(0.8), for: .disabled)
        
        loginButton.addTarget(self,
                              action: #selector(pushProfileViewController),
                              for: .touchUpInside)
        
        view.addSubview(loginScrollView)
        loginScrollView.addSubview(containerView)
        
        containerView.addSubViews(iconImage,
                                  loginFormView,
                                  loginButton)
        
        loginFormView.addSubViews(loginView,
                                  passwordView,
                                  separatorView)
        
        loginView.addSubview(loginTextField)
        passwordView.addSubview(passwordTextField)
        
        

        //MARK: Constraints
        let constraints = [
            
            //Располагаем scrollView
            loginScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            //Располагаем контейнер на scrollView
            containerView.topAnchor.constraint(equalTo: loginScrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: loginScrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: loginScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: loginScrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: loginScrollView.widthAnchor),
            
            //Располагаем нашу иконку
            iconImage.widthAnchor.constraint(equalToConstant: 100),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 120),
            iconImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            
            //Располагаем нашу основную вью, на которой будет параметры входа (логин и пароль)
            loginFormView.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 120),
            loginFormView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loginFormView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            loginFormView.heightAnchor.constraint(equalToConstant: 100),
            
            //Располагаем view, на которых будуте текстфилды
            loginView.topAnchor.constraint(equalTo: loginFormView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: loginFormView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: loginFormView.trailingAnchor),
            loginView.heightAnchor.constraint(equalToConstant: 50),
            
            passwordView.topAnchor.constraint(equalTo: loginFormView.topAnchor, constant: 50),
            passwordView.leadingAnchor.constraint(equalTo: loginFormView.leadingAnchor),
            passwordView.trailingAnchor.constraint(equalTo: loginFormView.trailingAnchor),
            passwordView.heightAnchor.constraint(equalToConstant: 50),
            
            separatorView.centerXAnchor.constraint(equalTo: loginFormView.centerXAnchor),
            separatorView.centerYAnchor.constraint(equalTo: loginFormView.centerYAnchor),
            separatorView.leadingAnchor.constraint(equalTo: loginFormView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: loginFormView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            //Добавляем кнопку
            loginButton.topAnchor.constraint(equalTo: loginFormView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            //Добавляем текстфилды на вью
            loginTextField.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            
            passwordTextField.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -16)
            
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    @objc func pushProfileViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "profileVC")
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    // MARK: Keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            loginScrollView.contentInset.bottom = keyboardSize.height
            loginScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        loginScrollView.contentInset.bottom = .zero
        loginScrollView.verticalScrollIndicatorInsets = .zero
    }

}


//MARK: Расширения
extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    func addSubViews (_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

