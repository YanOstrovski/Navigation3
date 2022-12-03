//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Профиль"
        
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
        
        //profileHeaderView.frame = self.view.frame
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        let marginGuides = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: marginGuides.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: marginGuides.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: marginGuides.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: marginGuides.bottomAnchor)
            
            ])
        
    }

}
