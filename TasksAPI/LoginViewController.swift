//
//  ViewController.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    

    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func registerTapped(_ sender: Any) {
//        performSegue(withIdentifier: "register", sender: nil)
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let tasksService = TasksService()
        tasksService.login(username: usernameTextField.text!, password: passwordTextField.text!) { response in
            DispatchQueue.main.async {
                if response != nil {
                    print("OK")
                    let alert = UIAlertController(title: "Welcome", message: "Hi", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Thank You", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Fail")
                    let alert = UIAlertController(title: "Error", message: "Wrong password or email", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
                
        }

    }
    
}

