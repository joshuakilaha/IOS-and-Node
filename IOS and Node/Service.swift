//
//  Service.swift
//  IOS and Node
//
//  Created by Kilz on 17/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
    func fetchPosts(completion: () -> ()) {
        guard let url = URL(string: "http://localhost:1337/posts")
            else {
                return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print("Failed to fetch Posts from the Url", err)
                return
            }
            guard let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8) ?? "")
        }.resume()
        
        
    }
    
}


