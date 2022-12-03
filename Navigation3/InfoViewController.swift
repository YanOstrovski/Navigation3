//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitle("Алерт!", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    @objc func buttonAction() {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default,
                                      handler: {(alert: UIAlertAction!) in print("User pressed Ok")}))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .destructive,
                                      handler: {(alert: UIAlertAction!) in print("User pressed Cancel")}))
        
        self.present(alert, animated: true, completion: nil)
    }
 
   

}
