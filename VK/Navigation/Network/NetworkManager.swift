//
//  NetworkManager.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 15.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

enum AppConfiguration: String, CaseIterable {
    
    case urlOne = "https://swapi.dev/api/films/1/"
    case urlTwo = "https://swapi.dev/api/films/2/"
    case urlThree = "https://swapi.dev/api/films/3/"
    
}

struct NetworkManager {
    
    static let session = URLSession.shared
    
    static func dataTask(url: URL, completion: @escaping (String?) -> Void) {
        
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

class DataLoader {
    
   static func loadDataWithSerialization(url: URL, callback: @escaping (User) -> Void) {
        
        NetworkManager.dataTask(url: url) { string in

            guard let string = string else {return}
            let data = Data(string.utf8)

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    guard let user = User(json: json) else {return}
                    callback(user)
                }
                
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
        }
    }
    
    static func loadDataWithDecode(url: URL, callback: @escaping (Planet) -> Void) {
        
        NetworkManager.dataTask(url: url) { string in
        
            guard let string = string else {return}
            let data = Data(string.utf8)
        
            do {
                let planet = try JSONDecoder().decode(Planet.self, from: data)
                callback(planet)
            
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }
    }
}
