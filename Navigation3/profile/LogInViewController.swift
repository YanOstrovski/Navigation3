//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {
    
//    let paddingView: UIView = UIView()
    
    //MARK: - VIEWS
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let logoImageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    let loginTextField: UITextField = {
        let textField = UITextFieldWithBounds()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.tintColor = UIColor(named: "accentColor")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextFieldWithBounds()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.tintColor = UIColor(named: "accentColor")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Log In", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        
        buttonView.backgroundImage(for: .normal)
        buttonView.layer.cornerRadius = 10
        buttonView.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        buttonView.clipsToBounds = true
        
        return buttonView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()

        setupScreen()
        setupConstraints()
        setupActionsForButtons()
        
    }
    
    func setupActionsForButtons() {
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    @objc func login(_ sender: UIButton!) {
        
        
        
        let profileViewController = ProfileViewController()
//        profileViewController.modalPresentationStyle = .automatic
//        profileViewController.modalTransitionStyle = .crossDissolve
        
        navigationController?.show(profileViewController, sender: self)
//        present(profileViewController, animated: true, completion: nil)
    }
    
    func setupScreen() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(loginButton)

        
    }
    
    func setupConstraints() {
        
        let safeArea = scrollView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            //LOGO
            logoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
            //LOGIN
            loginTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //PASSWORD
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //LOGIN BUTTON
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor, constant: 16)

        ])
    }
    
    
    deinit {
        removeKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height - self.view.safeAreaInsets.bottom + 20, right: 0)
//        let userInfo = notification.userInfo
//        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.view.frame.origin.y = 0 - kbFrameSize.height
    }
    
    @objc func kbWillHide() {
//        scrollView.contentInset = .zero
        self.view.frame.origin.y = 0
    }
    
}




class UITextFieldWithBounds: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}



