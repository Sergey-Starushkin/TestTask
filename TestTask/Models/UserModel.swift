//
//  UserModel.swift
//  TestTask
//
//  Created by Sergey Starushkin on 19.11.21.
//

import ObjectMapper

struct UserModel {
    var accessToken = ""
    var tokenType = ""
    var expiresIn = 0
    var scope = ""
    var createdAt = 0
}

extension UserModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        scope <- map["scope"]
        createdAt <- map["created_at"]
    }
}
