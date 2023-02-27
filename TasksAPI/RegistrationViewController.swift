//
//  RegistrationViewController.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func registerTapped(_ sender: Any) {
        let tasksService = TasksService()
        tasksService.registration { registration in
                return
        }
        return
    }
    
}
