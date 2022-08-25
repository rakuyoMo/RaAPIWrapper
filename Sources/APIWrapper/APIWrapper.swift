//
//  APIWrapper.swift
//  APIWrapper
//
//  Created by Rakuyo on 2022/8/25.
//  Copyright © 2022 Rakuyo. All rights reserved.
//

import Foundation

import Alamofire

/// API wrapper. Used to wrap the data needed to request an interface.
@propertyWrapper
open class APIWrapper<Parameter>: APIRequestInfoProtocol {
    public typealias HeaderBuilder = (Parameter) -> Header
    
    public typealias ParameterBuilder = (Parameter) -> APIParameters
    
    /// The path to the requested api
    public let path: String
    
    /// Type representing HTTP methods
    public let method: HTTPMethod
    
    /// Encoding of `Parameters`
    public let parameterEncoding: ParameterEncoding?
    
    /// Used to construct the api request header
    private let headerBuilder: HeaderBuilder?
    
    /// Used to construct the api request parameter
    private let parameterBuilder: ParameterBuilder?
    
    public init(
        path: String,
        method: HTTPMethod,
        header: HeaderBuilder? = nil,
        parameter: ParameterBuilder? = nil,
        parameterEncoding: ParameterEncoding? = nil
    ) {
        self.path = path
        self.method = method
        self.headerBuilder = header
        self.parameterBuilder = parameter
        self.parameterEncoding = parameterEncoding
    }
    
    open var wrappedValue: (Parameter) -> APIRequestInfo {
        return {
            .init(
                path: self.path,
                method: self.method,
                header: self.headerBuilder?($0),
                parameters: self.parameterBuilder?($0).toParameter,
                parameterEncoding: self.parameterEncoding
            )
        }
    }
    
    public var projectedValue: APIWrapper<Parameter> { self }
}