//

import UIKit

class ProfileHeaderView: UIView {
    
    var profileImageView: UIImageView = {
        
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
    
    var button: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Show status", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.layer.backgroundColor = UIColor.blue.cgColor
        buttonView.layer.cornerRadius = 4
        buttonView.layer.shadowRadius = 4
        buttonView.layer.shadowColor = UIColor.black.cgColor
        buttonView.layer.shadowOpacity = 0.7
        buttonView.layer.shadowOffset = CGSize(width: 4, height: 4)
        return buttonView
    }()
    
    var userName: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Hipster Cat"
        labelView.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return labelView
    }()
    
    var userStatus: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Waiting for something"
        labelView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        labelView.textColor = UIColor.gray
        return labelView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createScreenComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createScreenComponents() {
        self.addSubview(profileImageView)
        self.addSubview(button)
        self.addSubview(userName)
        self.addSubview(userStatus)
        addTargets()
        constraintElements()
    }
    
    func addTargets() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func constraintElements() {
        
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        userName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        userName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        userStatus.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        userStatus.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -16).isActive = true
        userStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func buttonPressed() {
        print(userStatus.text ?? "")
    }

    
    
}
