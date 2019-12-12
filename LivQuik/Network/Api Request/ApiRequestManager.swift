//
//  ApiRequestManager.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation

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
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?apiKey=7df0496730464bbda3d7aa76f337dac3&q=b&page=\(pageNo)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse else {
                let error = ResponseError(type: .unknownError)
                completionBlock(Result.failure(error))
                return
            }
            
            switch response.statusCode {
            case 200:
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(News.self, from: data)
                    DispatchQueue.main.async {
                        completionBlock(Result.success(json))
                    }
                } catch {}
                break
            
            case 426:
                DispatchQueue.main.async {
                    let error = ResponseError(type: .maximumLimitReached)
                    completionBlock(Result.failure(error))
                }
                break
                
            default:
                DispatchQueue.main.async {
                    let error = ResponseError(type: .unknownError)
                    completionBlock(Result.failure(error))
                }
                break
            }
        })
        task.resume()
    }
}
