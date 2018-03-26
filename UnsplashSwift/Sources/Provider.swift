//
//  Provider.swift
//  UnsplashSwift
//
//  Created by Joan Disho on 26.03.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation
import Alamofire

public class Provider<T: TargetType> {
    private let token: String?
    private let clientID: String?

    init(token: String) {
        self.token = token
        clientID = nil
    }

    init(clientID: String) {
        self.clientID = clientID
        self.token = nil
    }

    public func request(
        fromTarget target: T,
        headers: HTTPHeaders = [:]
        ) -> DataRequest {

        var headers = headers
        headers["Accept-Version"] = "v1"

        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        } else if let clientID = clientID {
            headers["Authorization"] = "Client-ID \(clientID)"
        }

        return Alamofire.request(
            target.endpoint,
            method: target.method,
            parameters: target.parameters,
            encoding: URLEncoding(
                destination: .methodDependent,
                arrayEncoding: .noBrackets,
                boolEncoding: .literal
            ),
            headers: headers
        )
        }
}
