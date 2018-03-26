//
//  UnsplashAuthManager.swift
//  UnsplashSwift
//
//  Created by Joan Disho on 26.03.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation
import Alamofire

public class UnsplashAuthManager {

    private let clientID: String
    private let clientSecret: String
    private let redirectURL: URL
    private let scopes: [Scope]

    public init(
        clientID: String,
        clientSecret: String,
        redirectURL: URL,
        scopes: [Scope] = [Scope.pub]
        ) {
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.redirectURL = redirectURL
        self.scopes = scopes
    }

    public func accessToken(
        withCode code: String,
        completion: @escaping (String?, Error?) -> Void
        ) {
        let url = accessTokenURL(withCode: code)
        Alamofire.request(url, method: .post).responseJSON { response in
            switch response.result {
            case let .success(value):
                if let json = value as? [String : Any],
                    let accessToken = json["access_token"] as? String {
                    completion(accessToken, nil)
                }
            case let .failure(error):
                    completion(nil, error)
            }
        }
    }

    public func authorizationURL() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "unsplash.com"
        components.path = "/oauth/authorize"


        var params: [String: String] = [:]
        params["response_type"] = "code"
        params["client_id"] = clientID
        params["redirect_uri"] = redirectURL.absoluteString
        params["scope"] = scopes.map { $0.string }.joined(separator: "+")

        let url = components.url?.appendingQueryParameters(params)

        return url!
    }

    public func accessTokenURL(withCode code: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "unsplash.com"
        components.path = "/oauth/token"

        var params: [String: String] = [:]
        params["grant_type"] = "authorization_code"
        params["client_id"] = clientID
        params["client_secret"] = clientSecret
        params["redirect_uri"] = redirectURL.absoluteString
        params["code"] = code

        let url = components.url?.appendingQueryParameters(params)

        return url!
    }

    public func extractCode(from url: URL) -> String? {
        guard let code = url.value(for: "code") else { return nil }
        return code
    }

}

public extension URL {

    func value(for queryKey: String) -> String? {
        let stringURL = self.absoluteString
        guard let items = URLComponents(string: stringURL)?.queryItems else { return nil }
        for item in items where item.name == queryKey {
            return item.value
        }
        return nil
    }

    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var queryItems = urlComponents.queryItems ?? []

        queryItems += parameters.map { URLQueryItem(name: $0, value: $1) }
        urlComponents.queryItems = queryItems

        return urlComponents.url!
    }
}

