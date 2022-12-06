//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Профиль"
        
        addElementsOnTheScreen()
        addConstraints()
        
    }
    
    func addElementsOnTheScreen() {
        self.view.addSubview(profileHeaderView)        
    }
    
    func addConstraints() {
        
        let marginGuides = self.view.layoutMarginsGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: marginGuides.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: marginGuides.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: marginGuides.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: marginGuides.bottomAnchor)
            
            ])
    }

}
