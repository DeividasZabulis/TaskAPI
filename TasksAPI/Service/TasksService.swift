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
    
    let baseURL = "http://134.122.94.77/api"
    let registrationEndPoint = "/user/register"
    let loginEndPoint = "/user/login"
    private var dataTask: URLSessionDataTask?
    
    func registration(username: String, password: String, completion: @escaping (User?) -> Void) {
        let url = URL(string: baseURL + registrationEndPoint)
        let register = Register(username: username, password: password)
        let data = try? JSONEncoder().encode(register)
        NetworkService.post(url: url!, body: data) { responseData in
            if let responseData = responseData {
                let userID = try? JSONDecoder().decode(User.self, from: responseData)
                completion(userID)
            } else { completion(nil)
                return }
        }
    }
    
    
    func login(username: String, password: String, completion: @escaping (User?) -> Void) {
        let url = URL(string: baseURL + loginEndPoint)
        let login = Login(username: username, password: password)
        let data = try? JSONEncoder().encode(login)
        NetworkService.post(url: url!, body: data) { responseData in
            if let responseData = responseData {
                let userID = try? JSONDecoder().decode(User.self, from: responseData)
                completion(userID)
            } else { completion(nil)
                return }
        }
    }
}
