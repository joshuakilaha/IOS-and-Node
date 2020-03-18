//
//  Service.swift
//  IOS and Node
//
//  Created by Kilz on 17/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation

class Service: NSObject {

    //var posts = [Post]()

    static let shared = Service()

    //MARK: GET Fetching JSON DATA
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        guard let url = URL(string: "http://localhost:1337/posts")
            else {
                return
        }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                 if let err = err {
                               print("Failed to fetch Posts from the Url", err)
                               return
                           }
                           guard let data = data else {
                               return
                           }

                           do {

                               //print(String(data: data, encoding: .utf8) ?? "")
                               let posts = try JSONDecoder().decode([Post].self, from: data)
                               completion(.success (posts))
                           }
                           catch {
                               completion(.failure(error))
                           }
                         //  print(String(data: data, encoding: .utf8) ?? "")
            }
        }.resume()


    }
    
    //MARK: CREATING ITEM
    
    func addItem(itemName: String, itemDescription: String, itemPrice: String, completion: @escaping (Error?) -> ()) {
        
        guard let url = URL(string: "http://localhost:1337/post")
            else {
                return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = ["itemName": itemName, "itemDescription": itemDescription, "itemPrice": itemPrice]
                      
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, res, err) in
                
                guard let data = data
                
                    else {
                        return
                }
                
                completion(nil)
               // print(String(data: data, encoding: .utf8))
                
            }.resume()
        } catch {
            completion(error)
        }
    }
    
   

}


