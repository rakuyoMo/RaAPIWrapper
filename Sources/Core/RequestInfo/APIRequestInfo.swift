//
//  APIRequestInfo.swift
//  RaAPIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

/// Information needed to request the api
public struct APIRequestInfo {
    /// The path to the requested api
    public let path: String
    
    /// A special api base url.
    ///
    /// Should be a setting item independent of your global configuration.
    public let specialBaseURL: URL?
    
    /// Type representing HTTP methods
    public let httpMethod: APIHTTPMethod
    
    /// API header
    public let header: APIHeaders?
    
    /// Parameters of the requested api
    public let parameters: AnyAPIParameter?
    
    /// An additional storage space.
    /// You can use this property to store some custom data.
    public let userInfo: APIRequestUserInfo
    
    public init(
        path: String,
        specialBaseURL: URL? = nil,
        httpMethod: APIHTTPMethod,
        header: APIHeaders? = nil,
        parameters: AnyAPIParameter? = nil,
        userInfo: APIRequestUserInfo = [:]
    ) {
        self.path = path
        self.specialBaseURL = specialBaseURL
        self.httpMethod = httpMethod
        self.header = header
        self.parameters = parameters
        self.userInfo = userInfo
    }
}

// MARK: - Hashable

extension APIRequestInfo: Hashable { }
