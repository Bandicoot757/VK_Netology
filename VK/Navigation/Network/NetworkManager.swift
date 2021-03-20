//
//  NetworkManager.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 15.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration: String {
    
    case urlOne = "https://swapi.dev/api/films/1/"
    case urlTwo = "https://swapi.dev/api/films/2/"
    case urlThree = "https://swapi.dev/api/films/3/"
    
}

struct NetworkManager {
    
    static let session = URLSession.shared
    
    static func dataTask(
        url: URL, completion: @escaping (String?) -> Void) {
        
        session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            print(httpResponse.allHeaderFields)
            print(httpResponse.statusCode)
            
            if let data = data {
                completion(String(data: data, encoding: .utf8))
            }
        }.resume()
    }
}
