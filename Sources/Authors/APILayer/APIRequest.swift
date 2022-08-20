//
//  APIRequest.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import Foundation

public enum APIRequest {
    case getAuthors
}

private enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

extension APIRequest {
    
    func make() -> URLRequest? {
        guard let url = self.url else { return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        return urlRequest
    }
    
    private var url: URL? {
        switch self {
        case .getAuthors:
            let urlStr = APIConstents.baseUrl + APIConstents.authorsList
            guard let url = URL(string: urlStr) else { return nil }
            return url
        }
    }
    
    private var headers: [String: String] {
        return [:]
    }
    
    private var httpMethod: HttpMethod {
        switch self {
        case .getAuthors:
            return .get
        }
    }
    
}
