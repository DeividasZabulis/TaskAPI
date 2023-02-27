//
//  NetworkService.swift
//  TasksAPI
//
//  Created by Deividas Zabulis on 2023-02-27.
//

import Foundation

class NetworkService {
    
    private var baseUrl: URL? = nil
    
    public static func post(url: URL, body: Data?, completion: @escaping (Data?) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            data,
            response,
            error in
                completion(data)
                return

        }.resume()
    }
    
    public static func get(url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            data,
            response,
            error in
            guard let data else {
                completion(nil)
                return
            }
            
            completion(data)
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
