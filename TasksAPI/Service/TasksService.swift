//
//  TasksService.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import UIKit

//enum EndPoints {
//    case register
//    case login
//}

class TasksService {
    
    // MARK: - Properties
    
    let baseURL = "http://134.122.94.77/api/user/register"
    private var dataTask: URLSessionDataTask?
    
    func registration(completion: @escaping (Register) -> Void) {
        let url = URL(string: baseURL)
        let register = Register(username: "antanas", password: "aaaa")
        let data = try? JSONEncoder().encode(register)
        NetworkService.post(url: url!, body: data) { data in
            print(String(data: data!, encoding: .utf8)!)
        }
    }
    
    
//    private func login(completion: @escaping (Login) -> Void) {
//
//    }
}
