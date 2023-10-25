//
//  DataFromDto.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation

protocol DataFromDto<T> {
    associatedtype T: Codable
    init(dto: T)
}
