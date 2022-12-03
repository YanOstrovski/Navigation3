//

import UIKit

class ProfileHeaderView: UIView {

    var profileImageView: UIImageView!
    var button: UIButton!
    var userName: UILabel!
    var userStatus: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createScreenComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createScreenComponents() {
        createProfileImage()
        createUserName()
        createStatus()
        createButtonShowStatus()
        constraintElements()
       
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
    
    func createButtonShowStatus() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        print(userStatus.text ?? "")
    }
    
    func createStatus() {
        userStatus = UILabel()
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        userStatus.text = "Waiting for something"
        userStatus.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        userStatus.textColor = UIColor.gray
        self.addSubview(userStatus)
    }
    
    func createUserName() {
        userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Hipster Cat"
        userName.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        self.addSubview(userName)
    }
    
    func createProfileImage() {
        profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        profileImageView.image = UIImage(named: "HipsterCat")
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileImageView)
    }
    
    
}
