//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.title = "Лента"
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitle("Пост", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let post = Post(title: "Я заголовок")
        
        let postVC = PostViewController()
        postVC.post = post
        //self.navigationController?.pushViewController(postVC, animated: true)
        show(postVC, sender: nil)
    }
    
}

struct Post {
    let title: String
}

