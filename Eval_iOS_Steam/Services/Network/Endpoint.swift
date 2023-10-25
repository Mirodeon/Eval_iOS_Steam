//
//  Endpoint.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

enum EndPoint {
    case featureGame
    
    func urlBuilder() -> String {
        switch self {
        case .featureGame:
            return BaseUrl.game("api/featured").getUrl()
        }
    }
    
}
