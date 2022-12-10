//

import UIKit

class FeedViewController: UIViewController {

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let post1Button: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Open post 1", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.layer.backgroundColor = UIColor.blue.cgColor
        return buttonView
    }()
    
    let post2Button: UIButton = {
        let buttonView = UIButton()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.setTitle("Open post 2", for: .normal)
        buttonView.setTitleColor(UIColor.white, for: .normal)
        buttonView.layer.backgroundColor = UIColor.blue.cgColor
        return buttonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.title = "Лента"
        
        addElementsOnTheScreen()
        setupConstraints()
        setButtonActions()
       
        
       
        
    }
    
    func setButtonActions() {
        post1Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        post2Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
        ])
    }
    
    func addElementsOnTheScreen() {
        stackView.addArrangedSubview(post1Button)
        stackView.addArrangedSubview(post2Button)
        self.view.addSubview(stackView)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let post = Post(title: "Я заголовок")
        
        let postVC = PostViewController()
        postVC.post = post
        show(postVC, sender: nil)
    }
    
}

struct Post {
    let title: String
}

