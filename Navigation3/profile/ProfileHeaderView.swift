//

import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "HipsterCat")
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let setStatusButton: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Set status", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.layer.backgroundColor = UIColor.blue.cgColor
        buttonView.layer.cornerRadius = 4
        buttonView.layer.shadowRadius = 4
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.7
        buttonView.layer.shadowOffset = CGSize(width: 4, height: 4)
        return buttonView
    }()
    
    let fullNameLabel: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Hipster Cat"
        labelView.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return labelView
    }()
    
    let statusLabel: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Waiting for something"
        labelView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        labelView.textColor = UIColor.gray
        return labelView
    }()
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter new status here"
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .roundedRect
        textField.isHidden = true
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createScreenComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createScreenComponents() {
        self.addSubview(avatarImageView)
        self.addSubview(setStatusButton)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        addTargets()
        constraintElements()
    }
    
    func addTargets() {
        setStatusButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
    }
    
    func constraintElements() {
        
        avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16).isActive = true
        setStatusButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
       
        
    }
    
    @objc func changeStatus() {
        //print(statusLabel.text ?? "")
        
        if (statusTextField.isHidden) {
            statusTextField.text = statusLabel.text
            statusTextField.isHidden = false
            statusLabel.isHidden = true
        } else {
            statusLabel.text = statusTextField.text
            statusTextField.isHidden = true
            statusLabel.isHidden = false
        }
        
    }

    
    
}
