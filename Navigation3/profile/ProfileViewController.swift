//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = ProfileHeaderView()
    
    var homeworkButton: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Кнопка из ProfileViewController", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.layer.backgroundColor = UIColor.blue.cgColor
        return buttonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Профиль"
        
        addElementsOnTheScreen()
        addConstraints()
        
    }
    
    func addElementsOnTheScreen() {
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(homeworkButton)        
    }
    
    func addConstraints() {
        
        let safeArea = self.view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            homeworkButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            homeworkButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeworkButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            ])
    }

}
