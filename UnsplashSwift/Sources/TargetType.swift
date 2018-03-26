//
//  TargetType.swift
//  UnsplashSwift
//
//  Created by Joan Disho on 27.03.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation
import Alamofire

public protocol TargetType {
    var endpoint: URL { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
}
