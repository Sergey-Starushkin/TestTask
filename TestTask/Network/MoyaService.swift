//
//  MoyaService.swift
//  TestTask
//
//  Created by Sergey Starushkin on 19.11.21.
//

import Moya

enum MoyaService {
    case login
    case getData
    case updateData(id: Int, userId: String, distance: Int, time: Int, date: String)
    case addData(distance: Int, time: Int, date: String)
    case sendFeedback(topic: Int, text: String)
}

extension MoyaService: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: url)!
    }
    
    var path: String {
        switch self {
            
        case .login:
            return "/v1/auth/uuidLogin"
        case .getData:
            return "/v1/data/sync"
        case .updateData:
            return "/v1/data/jog"
        case .addData:
            return "/v1/data/jog"
        case .sendFeedback:
            return "/v1/feedback/send"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .post
        case .getData:
            return .get
        case .updateData:
            return .put
        case .addData:
            return .post
        case .sendFeedback:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .login:
            return Data()
        case .getData:
            return Data()
        case .updateData:
            return Data()
        case .addData:
            return Data()
        case .sendFeedback:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .login:
            return .requestParameters(parameters: ["uuid": "hello"], encoding: JSONEncoding.default)
        case .getData:
            return .requestPlain
        case .updateData(let id, let userId, let distance, let time, let date):
            return .requestParameters(parameters: ["user_id": userId, "jog_id" : id, "distance" : distance, "time" : time, "date" : date], encoding: JSONEncoding.default)
        case .addData(let distance, let time, let date):
            return .requestParameters(parameters: ["distance" : distance, "time" : time, "date" : date], encoding: JSONEncoding.default)
        case .sendFeedback(let topic, let text):
            return .requestParameters(parameters: ["topic_id": topic, "text" : text], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",  "Authorization" : "Bearer \(loginModel.response.accessToken)"]
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .login:
            return .none
        case .getData:
            return .bearer
        case .updateData:
            return .bearer
        case .addData:
            return .bearer
        case .sendFeedback:
            return .bearer
        }
    }
    
    
}

    private extension String {
        var utf8Encoded: Data {
            return data(using: .utf8)!
        }
    }
