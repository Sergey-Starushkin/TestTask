//
//  JogsResponseModel.swift
//  TestTask
//
//  Created by Sergey Starushkin on 19.11.21.
//

import ObjectMapper

struct JogsResponseModel {
    var response = ResponseModel()
}

extension JogsResponseModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        response <- map["response"]
    }
}

struct ResponseModel {
    var jogs = [JogsModel]()
}

extension ResponseModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        jogs <- map["jogs"]
    }
}

struct JogsModel {
    var id = 0
    var user_id = ""
    var distance = 0.0
    var time = 0
    var date = 0
}

extension JogsModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        distance <- map["distance"]
        time <- map["time"]
        date <- map["date"]
    }
}


