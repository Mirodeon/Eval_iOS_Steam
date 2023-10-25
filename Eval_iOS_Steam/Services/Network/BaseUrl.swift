//
//  BaseUrl.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

enum BaseUrl {
    case game(_ path: String, _ queryParams: [(String, String)] = [])
    
    func getUrl() -> String {
        switch self {
        case .game(let path, let queryParamas):
            return "https://store.steampowered.com/" + path + addParameters(queryParams: queryParamas)
        }
    }
    
    private func addParameters(queryParams: [(String, String)]) -> String {
        let associateParams = queryParams.map { key, value in
            key + "=" + value
        }
        
        let result = associateParams.enumerated().reduce("") { path, element in
            path + (element.0 == 0 ? "?" : "&") + element.1
        }
        
        return result
    }
}
