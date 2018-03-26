//
//  Resolution.swift
//  UnsplashSwift
//
//  Created by Joan Disho on 26.03.18.
//  Copyright © 2018 Joan Disho. All rights reserved.
//

import Foundation

// Currently, the only resolution supported is “days”. 
// Unsplash probably will add more later.

public enum Resolution {
    case days

    var string: String {
        switch self {
        case .days:
            return "days"
        }
    }
}
