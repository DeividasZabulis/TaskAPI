//
//  TasksViewController.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tasks"
        setupTableView()
        setupNavigationBar()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    //MARK: - Functionality
    
    @objc private func didTapAdd() {
        
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        //        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
