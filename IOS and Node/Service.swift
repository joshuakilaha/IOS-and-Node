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

}


