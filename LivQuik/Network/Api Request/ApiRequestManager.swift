//
//  ApiRequestManager.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

class ResponseError {
    var type: ApiResponseError
    var error: Error
    
    init(error: Error, type: ApiResponseError) {
        self.error = error
        self.type = type
    }
}

enum ApiResponseError {
    case notFound
    case noData
}

enum Result<T, ResponseError> {
    case success(T)
    case failure(ResponseError)
}

class ApiRequestManager {
    
    private let dataTask = URLSession.shared
    
    private static var sharedManager: ApiRequestManager? = {
        return ApiRequestManager()
    }()
    
    public static func shared() -> ApiRequestManager {
        guard let manager = sharedManager else {
            return ApiRequestManager()
        }
        return manager
    }
    
    private init() {}
    
    func deInitialiseApiRequestManager() {
        ApiRequestManager.sharedManager = nil
    }
    
    public func makeNewsApiCall(pageNo: Int, completionBlock: @escaping (Result<Codable, ResponseError>) -> Void) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?apiKey=7df0496730464bbda3d7aa76f337dac3&q=b&page=1") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else {
                let error = ResponseError(error: error!, type: .noData)
                completionBlock(Result.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(NewsData.self, from: data)
                completionBlock(Result.success(json))
            } catch {
                
            }
        })
        task.resume()
    }
}
