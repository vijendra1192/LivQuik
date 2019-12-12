//
//  ResponseError.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 11/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import Foundation
/**
# Responsibility - From here we configure our error details
*/

class ResponseError {
    var type: ApiResponseError
    
    init(type: ApiResponseError) {
        self.type = type
    }
}

enum ApiResponseError {
    case maximumLimitReached
    case noData
    case unknownError
}

enum Result<T, ResponseError> {
    case success(T)
    case failure(ResponseError)
}
