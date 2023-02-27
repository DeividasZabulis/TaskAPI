//
//  NetworkService.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import Foundation

class NetworkService {
    public static func post(url: URL, body: Data?, completion: @escaping (Data?) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) {
            data,
            response,
            error in
                completion(data)
                return

        }.resume()
    }
    
    public static func uploadTask(request: URLRequest, data: Data, completion: @escaping (Data?) -> Void) {
        URLSession.shared.uploadTask(with: request, from: data) { (data, response, error) in
            if let _ = error {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
