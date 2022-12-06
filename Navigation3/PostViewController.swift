//

import UIKit

class PostViewController: UIViewController {

    var post: Post = Post(title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.title = post.title
        
        let button = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = button
        
    }
    
    @objc func showInfo() {
        let modalViewController = InfoViewController()
       
        modalViewController.modalPresentationStyle = .fullScreen
        modalViewController.modalTransitionStyle = .crossDissolve
                
        present(modalViewController, animated: true, completion: nil)
        
        //presentViewController(modalViewController, animated: true, completion: nil)
    }


}

