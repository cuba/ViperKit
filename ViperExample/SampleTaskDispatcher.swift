//
//  SampleTaskDispatcher.swift
//  ViperExample
//
//  Created by Jacob Sikorski on 2017-03-09.
//  Copyright © 2017 Tamarai. All rights reserved.
//

import Foundation

enum SampleError: Error {
    case somethingBad
}

extension SampleError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .somethingBad: return "Something bad happened. Great!"
        }
    }
}

class SampleTaskDispatcher {
    static func performLongTask(seconds: Int, successful: Bool = true, _ callback: @escaping (String?, Error?) -> Void) {
        let deadline = DispatchTime.now() + .seconds(seconds)
        
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            if successful {
                callback("Task successfully completed!", nil)
            } else {
                callback(nil, SampleError.somethingBad)
            }
        })
    }
}
