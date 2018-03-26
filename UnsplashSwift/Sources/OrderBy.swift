//
//  OrderBy.swift
//  UnsplashSwift
//
//  Created by Joan Disho on 26.03.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation

public enum OrderBy {
    case latest
    case oldest
    case popular
    
    var string: String {
        switch self {
        case .latest:
            return "latest"
        case .oldest:
            return "oldest"
        case .popular:
            return "popular"
        }
    }
}
