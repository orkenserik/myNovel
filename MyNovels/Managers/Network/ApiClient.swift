//
//  ApiClient.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias failure = (String) -> Void
typealias fieldFailure = (String, [String: [String]]?) -> Void

// MARK: - Enums
enum ResponseType {
    case model
    case array
}

class ApiClient {
    static let shared = ApiClient()
    
    // Object
    func makeRequest<T: Codable, Y: TargetType>(
                            _ target: Y,
                            objectModel: T.Type,
                            path: String? = nil,
                            showLoad:Bool = true,
                            success: ((_ returnData: T) -> Void)?,
                            failure: @escaping (String) -> Void?) {
        
        if Connectivity.isReachableM() {
            if showLoad { notifyStartLoading() }
            
//            let provider = MoyaProvider<Y>(manager: DefaultAlamofireManager.sharedManager, plugins: [NetworkLoggerPlugin(verbose: false, responseDataFormatter: JSONResponseDataFormatter)])
            let provider = MoyaProvider<Y>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                              logOptions: .verbose))])
            
//            let provider = MoyaProvider<Y>()
            
            provider.request(target) { (result) in
                
                if showLoad { self.notifyStopLoading() }
                
                switch result {
                case .success(let response):
                    do {
                        let returnData = try response.mapObject(objectModel.self, path: path)
                        success?(returnData)
                    }catch {
                        print("Error on parsing Object Model: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.checkForError(error) { (message, errorsDic) -> ()? in
                        failure(message)
                    }
                }
                
            }
        }
    }
    
    // Array
    func makeRequest<T: Codable, Y: TargetType>(
                            _ target: Y,
                            arrayModel: T.Type,
                            path: String? = nil,
                            showLoad:Bool = true,
                            success: ((_ returnData: [T]) -> Void)?,
                            failure: @escaping (String) -> Void) {
        
        if Connectivity.isReachableM() {
            
            if showLoad { notifyStartLoading() }
            
            let provider = MoyaProvider<Y>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                        logOptions: .verbose))])
//            let provider = MoyaProvider<Y>()
            
            provider.request(target) { (result) in
                
                if showLoad { self.notifyStopLoading() }
                
                switch result {
                case .success(let response):
                    do {
                        let returnData = try response.mapArray(arrayModel.self, path: path)
                        success?(returnData)
                    }catch {
                        print("Error on parsing Array Model: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.checkForError(error) { (message, errorsDic) -> ()? in
                        failure(message)
                    }
                }
            }
        }
    }
    
// Response
func makeRequest<Y: TargetType>(
                            _ target: Y,
                            showLoad:Bool = true,
                            _ success: ((_ response: Response) -> Void)?,
                            _ failure: @escaping (String) -> Void?) {

        if Connectivity.isReachableM() {
            if showLoad {
                notifyStartLoading()
            }

            let provider = MoyaProvider<Y>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                              logOptions: .verbose))])
//            let provider = MoyaProvider<Y>()

            provider.request(target) { [weak self] (result) in
                guard let `self` = self else {return}
                if showLoad {
                    self.notifyStopLoading()
                }

                switch result {
                case .success(let response):
                    success?(response)
                case .failure(let error):
                    self.checkForError(error) { (message, errorsDic) -> ()? in
                        failure(message)
                    }
                }
            }
        }
    }
}

//MARK: - Methods
extension ApiClient {
    
    private func checkForError(_ error: MoyaError, failure: @escaping (String, [String: [String]]?) -> ()?) {
        guard let statusCode = error.response?.statusCode else {return}
        
        switch statusCode {
        case 422:
            do {
                let error = try JSONDecoder().decode(NetworkError.self, from: error.response!.data)
                failure(error.message ?? "Указанные данные неверны!", error.errors)
            } catch {
                failure(error.localizedDescription, nil)
            }
        case 401:
            return
        default:
            failure(error.localizedDescription, nil)
        }
        
        let errorMessages = error.parseMessages()
        if let error = errorMessages[App.Field.default] {
            failure(error, nil)
        }
        if let errorMessage = errorMessages[App.Field.message] {
            failure(errorMessage,nil)
        }
    }
    
    private func notifyStartLoading() {
        NotificationCenter.default.post(name: .startLoading, object: nil)
    }
    
    private func notifyStopLoading() {
        NotificationCenter.default.post(name: .stopLoading, object: nil)
    }
    
    
}

// MARK: - Provider setup
private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}


