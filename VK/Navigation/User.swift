//
//  User.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 31.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

struct User {
    let userId: Int
    let id: Int
    let title: String
    let isCompleted: Bool
}

extension User {
    init?(json: [String: Any]) {
        
        guard let userId = json["userId"] as? Int,
              let id = json["id"] as? Int,
              let title = json["title"] as? String,
              let isCompleted = json["completed"] as? Bool
        
     else {return nil}
        
        self.userId = userId
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
}
