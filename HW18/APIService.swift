//
//  APIService.swift
//  HW18
//
//  Created by Павел on 05.03.2023.
//

import Foundation
import Alamofire

enum APIService {

   static let url = "https://jsonplaceholder.typicode.com/posts"
    
    static func postDataBySession(model: UserModel, completion: @escaping (String) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let loadData: Data? = try? JSONEncoder().encode(model)
        request.httpBody = loadData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(error.localizedDescription)
            } else {
                completion("ok")
            }
        }
        task.resume()
    }
    
    static func postDataByAlamofire(model: UserModel, completion: @escaping (String) -> Void) {
        AF.request(url, method: .post, parameters: model, encoder: JSONParameterEncoder.default).response {
            response in
            if let error = response.error {
                completion(error.localizedDescription)
            } else {
                completion("ok")
            }
        }
    }
}
