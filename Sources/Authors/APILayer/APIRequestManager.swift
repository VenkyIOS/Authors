//
//  APIRequestManager.swift
//  RawEngineeringTest
//
//  Created by Kurapav on 18/08/22.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidApiRequest
}

struct APIRequestManager {
    static func callApi<T: Decodable>(_ request: APIRequest) -> AnyPublisher<T, Error>? {
        if let req = request.make() {
            let dataTaskPublisher = URLSession.shared.dataTaskPublisher(for: req)
                .map(\.data)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError({ error in
                    return error
                })
            .eraseToAnyPublisher()
            return dataTaskPublisher
        }
        return .none
    }
}
