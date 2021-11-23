//
//  MoyaManager.swift
//  TestTask
//
//  Created by Sergey Starushkin on 19.11.21.
//

import Foundation
import ObjectMapper
import Moya_ObjectMapper
import Moya

class MoyaManager {
    let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .requestBody)
    var provider: MoyaProvider<MoyaService>
    
    init() {
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        provider = MoyaProvider<MoyaService>(plugins: [networkLogger])
    }
    
    func login(completion: @escaping ((Int, LoginModel?) -> Void)) {
        provider.request(.login, completion: { result in
            switch result {
            case .success(let response):
                if response.statusCode == 201 {
                    let userModel = try? response.mapObject(LoginModel.self)
                    loginModel = userModel ?? LoginModel()
                    print("LoginModel \(userModel)")
                    completion(response.statusCode, userModel)
                } else {
                    completion(response.statusCode, nil)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func sync(completion: @escaping ((Int, JogsResponseModel?) -> Void)) {
        provider.request(.getData, completion: { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    let jogsModel = try? response.mapObject(JogsResponseModel.self)
                    completion(response.statusCode, jogsModel)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func updateData(id: Int, userId: String, distance: Int, time: Int, date: String, completion: @escaping ((Int) -> Void)) {
        provider.request(.updateData(id: id, userId: userId, distance: distance, time: time, date: date), completion: { result in
            switch result {
            case .success(let response):
                completion(response.statusCode)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func addData(distance: Int, time: Int, date: String, completion: @escaping ((Int) -> Void)) {
        provider.request(.addData(distance: distance, time: time, date: date), completion: { result in
            switch result {
            case .success(let response):
                completion(response.statusCode)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func sendFeedback(topic: Int, text: String, completion: @escaping ((Int) -> Void)) {
        provider.request(.sendFeedback(topic: topic, text: text), completion: { result in
            switch result {
            case .success(let response):
                completion(response.statusCode)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}

